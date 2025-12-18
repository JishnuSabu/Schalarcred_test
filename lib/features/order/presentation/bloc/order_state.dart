import 'package:scholarcred_test/features/order/domain/entities/order.dart';

abstract class OrderState {}

class OrderInitial extends OrderState {}

class OrderLoading extends OrderState {}

class OrderLoaded extends OrderState {
  final OrderEntity order;
  OrderLoaded(this.order);
}

class OrderError extends OrderState {
  final String message;
  OrderError(this.message);
}
