import 'package:scholarcred_test/features/order/domain/entities/order.dart';
import '../repositories/order_repository.dart';

class GetOrderById {
  final OrderRepository repository;

  GetOrderById(this.repository);

  Future<OrderEntity> call(String orderId) {
    return repository.getOrderById(orderId);
  }
}
