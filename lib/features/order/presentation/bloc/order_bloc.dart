import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholarcred_test/features/order/domain/use_cases/create_order.dart';
import 'package:scholarcred_test/features/order/domain/use_cases/get_order_by_id.dart';
import 'package:scholarcred_test/features/order/presentation/bloc/order_event.dart';
import 'package:scholarcred_test/features/order/presentation/bloc/order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final CreateOrder createOrder;
  final GetOrderById getOrderById;

  OrderBloc({required this.createOrder, required this.getOrderById})
    : super(OrderInitial()) {
    on<CreateOrderEvent>(_create);
    on<FetchOrderEvent>(_fetch);
  }

  Future<void> _create(CreateOrderEvent event, Emitter<OrderState> emit) async {
    emit(OrderLoading());
    try {
      final order = await createOrder(event.order);
      emit(OrderLoaded(order));
    } catch (e) {
      emit(OrderError(e.toString()));
    }
  }

  Future<void> _fetch(FetchOrderEvent event, Emitter<OrderState> emit) async {
    emit(OrderLoading());
    try {
      final order = await getOrderById(event.orderId);
      emit(OrderLoaded(order));
    } catch (e) {
      emit(OrderError(e.toString()));
    }
  }
}
