import '../repositories/cart_repository.dart';
import '../../../product/domain/entities/product.dart';

class AddToCart {
  final CartRepository repository;

  AddToCart(this.repository);

  Future<void> call(Product product) async {
    return repository.addToCart(product);
  }
}
