import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scholarcred_test/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:scholarcred_test/features/cart/presentation/bloc/cart_event.dart';
import 'package:scholarcred_test/features/cart/presentation/bloc/cart_state.dart';
import 'package:scholarcred_test/features/cart/presentation/pages/widgets/cart_order_summary_card.dart';
import 'package:scholarcred_test/features/cart/presentation/pages/widgets/cart_quantity_button.dart';
import 'package:scholarcred_test/features/product/presentation/pages/footer_section.dart';
import 'package:scholarcred_test/features/product/presentation/pages/widgets/hexa_shop_logo.dart';
import 'package:scholarcred_test/features/product/presentation/pages/widgets/menu_item.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  static const double shippingCost = 10.0;

  @override
  Widget build(BuildContext context) {
    context.read<CartBloc>().add(FetchCartEvent());

    return Scaffold(
      backgroundColor: Colors.white,

      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is CartLoaded) {
            if (state.items.isEmpty) {
              return const Center(
                child: Text(
                  'Your cart is empty',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              );
            }

            final subtotal = state.items.fold<double>(
              0,
              (sum, item) => sum + (item.price * item.quantity),
            );
            final total = subtotal + shippingCost;

            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 80,
                    padding: const EdgeInsets.symmetric(horizontal: 70),
                    color: Color(0xFFD9D9D9),
                    child: Row(
                      children: [
                        HexashopLogo(
                          textClr: Color(0xFFFFFFFF),
                          logoClr: Color(0xFF000000),
                          companyNameClr: Color(0xFF000000),
                          companyCategryClr: Color(0xFF000000),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/home');
                          },
                          child: menuItem("Home", context),
                        ),
                        menuItem("Men’s", context),
                        menuItem("Kid’s", context),
                        menuItem("About Us", context),
                        menuItem("Contact Us", context),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Shopping Cart',
                                style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 10),
                              _buildCartHeader(),
                              ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: state.items.length,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 10),
                                itemBuilder: (context, index) {
                                  final item = state.items[index];
                                  return _buildCartItem(context, item);
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 40),
                        SizedBox(
                          height: 414,
                          width: 517,
                          child: cartOrderSummaryCard(
                            context,
                            subtotal,
                            total,
                            shippingCost,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  FooterSection(),
                ],
              ),
            );
          }

          return const Center(child: Text('Something went wrong'));
        },
      ),
    );
  }

  Widget _buildCartHeader() {
    return Row(
      children: [
        SizedBox(width: 72, height: 81),
        SizedBox(width: 15),
        Expanded(
          child: Text(
            'Name',
            style: GoogleFonts.inter(fontSize: 21, fontWeight: FontWeight.w500),
          ),
        ),
        Expanded(
          child: Text(
            'Amount',
            style: GoogleFonts.inter(fontSize: 21, fontWeight: FontWeight.w500),
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              'Quantity',
              style: GoogleFonts.inter(
                fontSize: 21,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              'Colour',
              style: GoogleFonts.inter(
                fontSize: 21,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCartItem(BuildContext context, dynamic item) {
    return Row(
      children: [
        SizedBox(
          width: 72,
          height: 81,
          child: Image.network(
            item.image,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey.shade200,
                child: const Icon(Icons.image, color: Colors.grey),
              );
            },
          ),
        ),
        SizedBox(width: 15),
        Expanded(
          child: Text(
            item.name,
            style: GoogleFonts.inter(fontSize: 22, fontWeight: FontWeight.w400),
          ),
        ),
        Expanded(
          child: Text(
            '\$${item.price.toStringAsFixed(2)}',
            style: GoogleFonts.inter(fontSize: 22, fontWeight: FontWeight.w400),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              cartQuantityButton(context, '-', () {
                if (item.quantity > 1) {
                  context.read<CartBloc>().add(
                    UpdateCartQuantityEvent(
                      cartId: item.id,
                      quantity: item.quantity - 1,
                    ),
                  );
                } else {
                  context.read<CartBloc>().add(RemoveFromCartEvent(item.id));
                }
              }),
              Container(
                width: 40,
                alignment: Alignment.center,
                child: Text(
                  '${item.quantity}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              cartQuantityButton(context, '+', () {
                context.read<CartBloc>().add(
                  UpdateCartQuantityEvent(
                    cartId: item.id,
                    quantity: item.quantity + 1,
                  ),
                );
              }),
            ],
          ),
        ),
        Expanded(
          child: Center(
            child: Text(item.color, style: const TextStyle(fontSize: 16)),
          ),
        ),
      ],
    );
  }
}
