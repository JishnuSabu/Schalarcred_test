import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholarcred_test/features/cart/domain/use_cases/add_to_cart.dart';
import 'package:scholarcred_test/features/cart/domain/use_cases/clear_cart.dart';
import 'package:scholarcred_test/features/cart/domain/use_cases/get_cart_items.dart';
import 'package:scholarcred_test/features/cart/domain/use_cases/remove_from_cart.dart';
import 'package:scholarcred_test/features/cart/domain/use_cases/update_cart_qty.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final AddToCart addToCart;
  final GetCartItems getCartItems;
  final UpdateCartQuantity updateCartQuantity;
  final RemoveFromCart removeFromCart;
  final ClearCart clearCart;

  CartBloc({
    required this.addToCart,
    required this.getCartItems,
    required this.updateCartQuantity,
    required this.removeFromCart,
    required this.clearCart,
  }) : super(CartInitial()) {
    on<AddToCartEvent>(_onAddToCart);
    on<FetchCartEvent>(_onFetchCart);
    on<UpdateCartQuantityEvent>(_onUpdateQuantity);
    on<RemoveFromCartEvent>(_onRemoveItem);
    on<ClearCartEvent>(_onClearCart);
  }

  Future<void> _onAddToCart(
    AddToCartEvent event,
    Emitter<CartState> emit,
  ) async {
    await addToCart(event.product);
    add(FetchCartEvent());
  }

  Future<void> _onFetchCart(
    FetchCartEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(CartLoading());
    final items = await getCartItems();
    emit(CartLoaded(items));
  }

  Future<void> _onUpdateQuantity(
    UpdateCartQuantityEvent event,
    Emitter<CartState> emit,
  ) async {
    await updateCartQuantity(cartId: event.cartId, quantity: event.quantity);
    add(FetchCartEvent());
  }

  Future<void> _onRemoveItem(
    RemoveFromCartEvent event,
    Emitter<CartState> emit,
  ) async {
    await removeFromCart(event.cartId);
    add(FetchCartEvent());
  }

  Future<void> _onClearCart(
    ClearCartEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(CartLoading());
    await clearCart();
    emit(CartLoaded([]));
    if (event.onComplete != null) {
      event.onComplete!();
    }
  }
}
