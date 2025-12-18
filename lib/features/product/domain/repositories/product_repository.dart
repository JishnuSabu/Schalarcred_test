import 'package:scholarcred_test/features/product/data/data_sources/supabase_product_data_sources.dart';
import 'package:scholarcred_test/features/product/domain/entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
}

class ProductRepositoryImpl implements ProductRepository {
  final SupabaseProductDataSource dataSource;

  ProductRepositoryImpl(this.dataSource);

  @override
  Future<List<Product>> getProducts() async {
    final models = await dataSource.fetchProducts();

    return models.map((model) {
      return Product(
        id: model.id,
        name: model.name,
        price: model.price,
        image: model.image,
        rating: model.rating,
        category: model.category,
      );
    }).toList();
  }
}
