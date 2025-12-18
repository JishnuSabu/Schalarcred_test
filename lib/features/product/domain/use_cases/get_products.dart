import 'package:scholarcred_test/features/product/domain/entities/product.dart';
import 'package:scholarcred_test/features/product/domain/repositories/product_repository.dart';

class GetProducts {
  final ProductRepository repository;

  GetProducts(this.repository);

  Future<List<Product>> call() {
    return repository.getProducts();
  }
}
