import 'package:scholarcred_test/features/cart/domain/repositories/cart_repository.dart';

class ClearCart {
  final CartRepository repository;

  ClearCart(this.repository);

  Future<void> call() async {
    await repository.clearCart();
  }
}
