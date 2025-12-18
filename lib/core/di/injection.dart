import 'package:get_it/get_it.dart';
import 'package:scholarcred_test/features/auth/data/data_sources/supabase_auth_data_sources.dart';
import 'package:scholarcred_test/features/auth/domain/repositories/auth_repository.dart';
import 'package:scholarcred_test/features/auth/domain/use_cases/login_user.dart';
import 'package:scholarcred_test/features/auth/domain/use_cases/register_user.dart';
import 'package:scholarcred_test/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:scholarcred_test/features/cart/data/data_sources/supabse_cart_data_resources.dart';
import 'package:scholarcred_test/features/cart/domain/repositories/cart_repository.dart';
import 'package:scholarcred_test/features/cart/domain/use_cases/add_to_cart.dart';
import 'package:scholarcred_test/features/cart/domain/use_cases/clear_cart.dart';
import 'package:scholarcred_test/features/cart/domain/use_cases/get_cart_items.dart';
import 'package:scholarcred_test/features/cart/domain/use_cases/remove_from_cart.dart';
import 'package:scholarcred_test/features/cart/domain/use_cases/update_cart_qty.dart';
import 'package:scholarcred_test/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:scholarcred_test/features/order/domain/repositories/order_repository.dart';
import 'package:scholarcred_test/features/order/domain/use_cases/create_order.dart';
import 'package:scholarcred_test/features/order/domain/use_cases/get_order_by_id.dart';
import 'package:scholarcred_test/features/order/presentation/bloc/order_bloc.dart';
import 'package:scholarcred_test/features/product/data/data_sources/supabase_product_data_sources.dart';
import 'package:scholarcred_test/features/product/domain/repositories/product_repository.dart';
import 'package:scholarcred_test/features/product/domain/use_cases/get_products.dart';
import 'package:scholarcred_test/features/product/presentation/bloc/product_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // ------------------------
  // External
  // ------------------------
  sl.registerLazySingleton(() => Supabase.instance.client);

  // ------------------------
  // Product Section
  // ------------------------
  // Data sources
  sl.registerLazySingleton(() => SupabaseProductDataSource(sl()));

  // Repositories
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => GetProducts(sl()));

  // Bloc
  sl.registerFactory(() => ProductBloc());

  // ------------------------
  // Auth Section
  // ------------------------
  // Data source
  sl.registerLazySingleton(() => SupabaseAuthDataSource(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  // Use cases
  sl.registerLazySingleton(() => LoginUser(sl()));
  sl.registerLazySingleton(() => RegisterUser(sl()));

  // Bloc
  sl.registerFactory(() => AuthBloc(loginUser: sl(), registerUser: sl()));

  // 🆕 Cart
  // ------------------------
  // Data source
  sl.registerLazySingleton(() => SupabaseCartDataSource(sl()));

  // Repository
  sl.registerLazySingleton<CartRepository>(() => CartRepositoryImpl(sl()));

  // Use cases
  sl.registerLazySingleton(() => AddToCart(sl()));
  sl.registerLazySingleton(() => GetCartItems(sl()));
  sl.registerLazySingleton(() => UpdateCartQuantity(sl()));
  sl.registerLazySingleton(() => RemoveFromCart(sl()));
  sl.registerLazySingleton(() => ClearCart(sl()));

  // Bloc
  sl.registerFactory(
    () => CartBloc(
      clearCart: sl(),
      addToCart: sl(),
      getCartItems: sl(),
      updateCartQuantity: sl(),
      removeFromCart: sl(),
    ),
  );

  sl.registerLazySingleton<OrderRepository>(
    () => OrderRepositoryImpl(sl<SupabaseClient>()),
  );

  // Use cases
  sl.registerLazySingleton(() => CreateOrder(sl()));
  sl.registerLazySingleton(() => GetOrderById(sl()));

  // Bloc
  sl.registerFactory(() => OrderBloc(createOrder: sl(), getOrderById: sl()));
}
