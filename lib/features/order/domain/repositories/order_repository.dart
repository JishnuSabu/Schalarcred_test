import 'package:scholarcred_test/features/order/domain/entities/order.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class OrderRepository {
  Future<OrderEntity> createOrder(OrderEntity order);
  Future<OrderEntity> getOrderById(String orderId);
}

class OrderRepositoryImpl implements OrderRepository {
  final SupabaseClient client;

  OrderRepositoryImpl(this.client);

  @override
  Future<OrderEntity> createOrder(OrderEntity order) async {
    final res = await client
        .from('orders')
        .insert(order.toJson())
        .select()
        .single();

    return OrderEntity.fromJson(res);
  }

  @override
  Future<OrderEntity> getOrderById(String orderId) async {
    final res = await client.from('orders').select().eq('id', orderId).single();

    return OrderEntity.fromJson(res);
  }
}
