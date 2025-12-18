import 'package:scholarcred_test/features/cart/data/data_sources/supabse_cart_data_resources.dart';

import '../../../product/domain/entities/product.dart';
import '../entities/cart_item.dart';

abstract class CartRepository {
  Future<void> addToCart(Product product);

  Future<List<CartItem>> getCartItems();

  Future<void> updateQuantity(String cartId, int quantity);

  Future<void> removeFromCart(String cartId);

  Future<void> clearCart();
}

class CartRepositoryImpl implements CartRepository {
  final SupabaseCartDataSource dataSource;

  CartRepositoryImpl(this.dataSource);

  @override
  Future<void> addToCart(Product product) {
    return dataSource.addToCart(product);
  }

  @override
  Future<List<CartItem>> getCartItems() {
    return dataSource.getCartItems();
  }

  @override
  Future<void> updateQuantity(String cartId, int quantity) {
    return dataSource.updateQuantity(cartId, quantity);
  }

  @override
  Future<void> removeFromCart(String cartId) {
    return dataSource.removeFromCart(cartId);
  }

  @override
  Future<void> clearCart() {
    return dataSource.clearCart();
  }
}
