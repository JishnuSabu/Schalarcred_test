import '../repositories/cart_repository.dart';

class UpdateCartQuantity {
  final CartRepository repository;

  UpdateCartQuantity(this.repository);

  Future<void> call({required String cartId, required int quantity}) async {
    return repository.updateQuantity(cartId, quantity);
  }
}
