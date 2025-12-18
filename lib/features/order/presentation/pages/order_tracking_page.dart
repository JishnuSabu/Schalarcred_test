import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scholarcred_test/features/order/domain/entities/order.dart';
import 'package:scholarcred_test/features/order/presentation/bloc/order_bloc.dart';
import 'package:scholarcred_test/features/order/presentation/bloc/order_event.dart';
import 'package:scholarcred_test/features/order/presentation/bloc/order_state.dart';
import 'package:scholarcred_test/features/product/presentation/pages/footer_section.dart';
import 'package:scholarcred_test/features/product/presentation/pages/widgets/hexa_shop_logo.dart';
import 'package:scholarcred_test/features/product/presentation/pages/widgets/menu_item.dart';

class OrderTrackingPage extends StatelessWidget {
  const OrderTrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get order ID from route arguments
    final orderId = ModalRoute.of(context)?.settings.arguments as String?;

    // Trigger order fetch if we have an order ID
    if (orderId != null) {
      // Use addPostFrameCallback to avoid calling during build
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.read<OrderBloc>().add(FetchOrderEvent(orderId));
      });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Container(
              height: 80,
              padding: const EdgeInsets.symmetric(horizontal: 70),
              color: const Color(0xFFD9D9D9),
              child: Row(
                children: [
                  HexashopLogo(
                    textClr: const Color(0xFFFFFFFF),
                    logoClr: const Color(0xFF000000),
                    companyNameClr: const Color(0xFF000000),
                    companyCategryClr: const Color(0xFF000000),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    child: menuItem("Home", context),
                  ),
                  menuItem("Men's", context),
                  menuItem("Women's", context),
                  menuItem("Kid's", context),
                  menuItem("About Us", context),
                  menuItem("Contact Us", context),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // Order Tracking Content
            BlocBuilder<OrderBloc, OrderState>(
              builder: (context, state) {
                if (state is OrderLoading) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(100.0),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                if (state is OrderError) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(100.0),
                      child: Column(
                        children: [
                          Text(
                            'Error: ${state.message}',
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              color: Colors.red,
                            ),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/home');
                            },
                            child: const Text('Go to Home'),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                if (state is OrderLoaded) {
                  return _buildOrderDetails(context, state.order);
                }

                return const SizedBox();
              },
            ),

            const SizedBox(height: 60),
            const FooterSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderDetails(BuildContext context, OrderEntity order) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70),
          child: Text(
            'Track Your Order',
            style: GoogleFonts.inter(fontSize: 36, fontWeight: FontWeight.w700),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(color: const Color(0xFFD9D9D9)),
          child: Padding(
            padding: EdgeInsets.only(left: 70, right: 70, top: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Order Details',
                  style: GoogleFonts.inter(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _formatDate(order.createdAt),
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Order No: ${order.id}',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Order Status: ${order.status}',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Packages in this Order: ${order.items.length}',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Total Items: ${order.totalItems}',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ship to:',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Lahore Road, Sheikhupura',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'Payment Information:',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Credit Card No:2522 2322 5455 2566',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Order Summary',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 12),

                          _buildSummaryRow('Subtotal:', order.subtotal),
                          const SizedBox(height: 8),
                          _buildSummaryRow('Shipping:', order.shipping),
                          const SizedBox(height: 8),
                          _buildSummaryRow('Sales Tax:', 0.0),
                          const SizedBox(height: 12),
                          Divider(color: Color(0xFF000000)),
                          const SizedBox(height: 12),

                          _buildSummaryRow(
                            'Total       ',
                            order.total,
                            isBold: true,
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),

                    Expanded(
                      flex: 1.5.toInt(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 16,
                              ),
                              side: const BorderSide(color: Color(0XFF000000)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              'Modify / Cancel Order',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0XFF000000),
                              ),
                            ),
                          ),
                          const SizedBox(height: 22),

                          OutlinedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/home');
                            },
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 16,
                              ),
                              side: const BorderSide(
                                color: Color(0XFF000000),
                                width: 2,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                            ),
                            child: Text(
                              'Discover More',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color(0XFF000000),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryRow(String label, double amount, {bool isBold = false}) {
    return Text(
      '$label${amount.toStringAsFixed(0)}\$',
      style: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
      ),
    );
  }

  String _formatDate(DateTime? date) {
    if (date == null) return 'July 10, 2022';

    final months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];

    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }
}
