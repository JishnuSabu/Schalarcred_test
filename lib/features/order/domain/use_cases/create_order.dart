import 'package:scholarcred_test/features/order/domain/entities/order.dart';
import 'package:scholarcred_test/features/order/domain/repositories/order_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CreateOrder {
  final OrderRepository repository;

  CreateOrder(this.repository);

  Future<OrderEntity> call(OrderEntity order) async {
    final user = Supabase.instance.client.auth.currentUser;

    if (user == null) {
      throw Exception('User not logged in');
    }

    return repository.createOrder(order.copyWith(userId: user.id));
  }
}
