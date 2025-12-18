import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scholarcred_test/core/images_path/images.dart';
import 'package:scholarcred_test/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:scholarcred_test/features/cart/presentation/bloc/cart_event.dart';
import 'package:scholarcred_test/features/cart/presentation/bloc/cart_state.dart';
import 'package:scholarcred_test/features/order/domain/entities/order.dart';
import 'package:scholarcred_test/features/order/presentation/bloc/order_bloc.dart';
import 'package:scholarcred_test/features/order/presentation/bloc/order_event.dart';
import 'package:scholarcred_test/features/order/presentation/bloc/order_state.dart';

Widget cartOrderSummaryCard(
  BuildContext context,
  double subtotal,
  double total,
  double shippingCost,
) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 10,
          offset: const Offset(0, 4),
          spreadRadius: 2,
        ),
      ],
    ),
    padding: const EdgeInsets.all(12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Order Summary',
          style: GoogleFonts.inter(fontSize: 30, fontWeight: FontWeight.w500),
        ),
        const Divider(thickness: 2, color: Colors.black),
        const SizedBox(height: 8),
        Container(
          width: 457,
          height: 50,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: Center(
            child: Text(
              'Have a promo code',
              style: GoogleFonts.inter(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        _buildSummaryRow('Payable Amount', subtotal),
        const SizedBox(height: 12),
        _buildSummaryRow('Shipping', shippingCost),
        const SizedBox(height: 12),
        const Divider(thickness: 2, color: Colors.black),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Order Total',
              style: GoogleFonts.inter(
                fontSize: 22,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              '\$${total.toStringAsFixed(2)}',
              style: GoogleFonts.inter(
                fontSize: 22,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        BlocBuilder<CartBloc, CartState>(
          builder: (context, cartState) {
            if (cartState is! CartLoaded || cartState.items.isEmpty) {
              return const SizedBox();
            }

            final cartItems = cartState.items;
            return BlocConsumer<OrderBloc, OrderState>(
              listener: (context, state) {
                if (state is OrderLoaded) {
                  context.read<CartBloc>().add(ClearCartEvent());
                  Navigator.pushNamed(
                    context,
                    '/order-tracking',
                    arguments: state.order.id,
                  );
                }
                if (state is OrderError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              builder: (context, state) {
                return InkWell(
                  onTap: state is OrderLoading
                      ? null
                      : () {
                          context.read<OrderBloc>().add(
                            CreateOrderEvent(
                              OrderEntity.empty(
                                userId: '',
                                subtotal: subtotal,
                                shipping: shippingCost,
                                total: total,
                                items: cartItems,
                              ),
                            ),
                          );
                        },
                  child: Container(
                    height: 52,
                    width: 220,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 3),
                      color: Colors.white,
                    ),
                    child: state is OrderLoading
                        ? const SizedBox(
                            height: 22,
                            width: 22,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Text(
                            'Proceed To Checkout',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  ),
                );
              },
            );
          },
        ),
        const SizedBox(height: 12),
        SizedBox(height: 25, width: 130, child: Image.asset(Images.payment)),
      ],
    ),
  );
}

Widget _buildSummaryRow(String label, double amount) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        label,
        style: GoogleFonts.inter(fontSize: 22, fontWeight: FontWeight.w400),
      ),
      Text(
        '\$${amount.toStringAsFixed(2)}',
        style: GoogleFonts.inter(fontSize: 22, fontWeight: FontWeight.w400),
      ),
    ],
  );
}
