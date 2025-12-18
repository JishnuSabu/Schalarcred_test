import '../repositories/cart_repository.dart';

class RemoveFromCart {
  final CartRepository repository;

  RemoveFromCart(this.repository);

  Future<void> call(String cartId) async {
    return repository.removeFromCart(cartId);
  }
}
