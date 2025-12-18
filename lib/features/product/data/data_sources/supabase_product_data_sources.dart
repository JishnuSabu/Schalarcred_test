import 'package:scholarcred_test/features/product/data/model/product_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseProductDataSource {
  final SupabaseClient client;

  SupabaseProductDataSource(this.client);

  Future<List<ProductModel>> fetchProducts() async {
    final res = await client.from('products').select();
    return (res as List).map((e) => ProductModel.fromJson(e)).toList();
  }
}
