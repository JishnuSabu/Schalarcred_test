import 'package:equatable/equatable.dart';
import 'package:scholarcred_test/features/cart/domain/entities/cart_item.dart';

class OrderEntity extends Equatable {
  final String id; // Supabase generated
  final String userId; // Auth user id
  final double subtotal;
  final double shipping;
  final double total;
  final String status; // New Order / Processing / Delivered
  final DateTime createdAt;
  final int totalItems;
  final List<CartItem> items;

  const OrderEntity({
    required this.id,
    required this.userId,
    required this.subtotal,
    required this.shipping,
    required this.total,
    required this.status,
    required this.createdAt,
    required this.totalItems,
    required this.items,
  });

  /// Empty constructor (useful for create flow)
  factory OrderEntity.empty({
    required String userId,
    required double subtotal,
    required double shipping,
    required double total,
    required List<CartItem> items,
  }) {
    return OrderEntity(
      id: '',
      userId: userId,
      subtotal: subtotal,
      shipping: shipping,
      total: total,
      status: 'New Order',
      createdAt: DateTime.now(),
      totalItems: items.fold(0, (sum, i) => sum + i.quantity),
      items: items,
    );
  }

  /// Supabase → Entity
  factory OrderEntity.fromJson(Map<String, dynamic> json) {
    return OrderEntity(
      id: json['id'],
      userId: json['user_id'],
      subtotal: (json['subtotal'] as num).toDouble(),
      shipping: (json['shipping'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      status: json['status'],
      createdAt: DateTime.parse(json['created_at']),
      totalItems: json['total_items'],
      items: (json['items'] as List<dynamic>? ?? [])
          .map(
            (e) => CartItem(
              id: e['id'],
              productId: e['product_id'],
              name: e['name'],
              price: (e['price'] as num).toDouble(),
              quantity: e['quantity'],
              image: e['image'],
              color: e['color'],
            ),
          )
          .toList(),
    );
  }

  /// Entity → Supabase (orders table)
  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'subtotal': subtotal,
      'shipping': shipping,
      'total': total,
      'status': status,
      'total_items': totalItems,
    };
  }

  /// Entity → Supabase (order_items table)
  List<Map<String, dynamic>> itemsToJson(String orderId) {
    return items
        .map(
          (item) => {
            'order_id': orderId,
            'product_id': item.productId,
            'name': item.name,
            'price': item.price,
            'quantity': item.quantity,
            'image': item.image,
            'color': item.color,
          },
        )
        .toList();
  }

  OrderEntity copyWith({String? id, String? userId, String? status}) {
    return OrderEntity(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      subtotal: subtotal,
      shipping: shipping,
      total: total,
      status: status ?? this.status,
      createdAt: createdAt,
      totalItems: totalItems,
      items: items,
    );
  }

  @override
  List<Object?> get props => [
    id,
    userId,
    subtotal,
    shipping,
    total,
    status,
    createdAt,
    totalItems,
    items,
  ];
}
