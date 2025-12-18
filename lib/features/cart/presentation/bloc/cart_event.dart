import 'package:equatable/equatable.dart';
import '../../../product/domain/entities/product.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

class AddToCartEvent extends CartEvent {
  final Product product;

  const AddToCartEvent(this.product);

  @override
  List<Object?> get props => [product];
}

class FetchCartEvent extends CartEvent {}

class UpdateCartQuantityEvent extends CartEvent {
  final String cartId;
  final int quantity;

  const UpdateCartQuantityEvent({required this.cartId, required this.quantity});

  @override
  List<Object?> get props => [cartId, quantity];
}

class RemoveFromCartEvent extends CartEvent {
  final String cartId;

  const RemoveFromCartEvent(this.cartId);

  @override
  List<Object?> get props => [cartId];
}

class ClearCartEvent extends CartEvent {
  final Function()? onComplete;

  const ClearCartEvent({this.onComplete});

  @override
  List<Object?> get props => [];
}
