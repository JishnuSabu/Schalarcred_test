import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../product/domain/entities/product.dart';
import '../../domain/entities/cart_item.dart';

class SupabaseCartDataSource {
  final SupabaseClient client;

  SupabaseCartDataSource(this.client);

  Future<void> addToCart(Product product) async {
    final user = client.auth.currentUser;
    if (user == null) throw Exception("User not logged in");

    final userId = user.id;

    final existing = await client
        .from('cart_items')
        .select()
        .eq('user_id', userId)
        .eq('product_id', product.id)
        .limit(1)
        .maybeSingle();

    if (existing != null) {
      await client
          .from('cart_items')
          .update({
            'quantity': existing['quantity'] + 1,
            'name': product.name,
            'price': product.price,
            'image': product.image,
            'color': 'Red',
          })
          .eq('id', existing['id']);
    } else {
      await client.from('cart_items').insert({
        'user_id': userId,
        'product_id': product.id,
        'name': product.name,
        'price': product.price,
        'quantity': 1,
        'image': product.image,
        'color': 'Red',
      });
    }
  }

  Future<List<CartItem>> getCartItems() async {
    final user = client.auth.currentUser;
    if (user == null) return [];

    final response = await client
        .from('cart_items')
        .select()
        .eq('user_id', user.id);

    return (response as List).map((json) {
      return CartItem(
        id: json['id'],
        productId: json['product_id'],
        name: json['name'],
        price: (json['price'] as num).toDouble(),
        quantity: json['quantity'],
        image: json['image'],
        color: json['color'],
      );
    }).toList();
  }

  Future<void> updateQuantity(String cartId, int quantity) async {
    if (quantity <= 0) {
      await removeFromCart(cartId);
      return;
    }

    await client
        .from('cart_items')
        .update({'quantity': quantity})
        .eq('id', cartId);
  }

  Future<void> removeFromCart(String cartId) async {
    await client.from('cart_items').delete().eq('id', cartId);
  }

  Future<void> clearCart() async {
    final user = client.auth.currentUser;
    if (user == null) return;

    await client.from('cart').delete().eq('user_id', user.id);
  }
}
