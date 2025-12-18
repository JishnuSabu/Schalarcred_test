import 'package:scholarcred_test/features/order/domain/entities/order.dart';

abstract class OrderEvent {}

class CreateOrderEvent extends OrderEvent {
  final OrderEntity order;
  CreateOrderEvent(this.order);
}

class FetchOrderEvent extends OrderEvent {
  final String orderId;
  FetchOrderEvent(this.orderId);
}
