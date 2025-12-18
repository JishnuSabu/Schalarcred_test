import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scholarcred_test/core/di/injection.dart';
import 'package:scholarcred_test/features/cart/presentation/pages/cart_page.dart';
import 'package:scholarcred_test/features/order/presentation/bloc/order_bloc.dart';
import 'package:scholarcred_test/features/order/presentation/pages/order_tracking_page.dart';
import 'package:scholarcred_test/features/product/presentation/bloc/product_bloc.dart';
import 'package:scholarcred_test/features/product/presentation/bloc/product_event.dart';
import 'package:scholarcred_test/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:scholarcred_test/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:scholarcred_test/features/auth/presentation/pages/login_page.dart';
import 'package:scholarcred_test/features/auth/presentation/pages/register_page.dart';
import 'package:scholarcred_test/features/product/presentation/pages/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://qbpztorqbgkslkuxchel.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFicHp0b3JxYmdrc2xrdXhjaGVsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjU4NjQxMTEsImV4cCI6MjA4MTQ0MDExMX0.HVwGaf-v2xX-aCHWdffxfaF65CEDLVUY1BCeoPBZC8Q',
  );

  await init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (_) => sl<AuthBloc>()),
        BlocProvider<ProductBloc>(
          create: (_) => sl<ProductBloc>()..add(FetchProducts()),
        ),
        BlocProvider<CartBloc>(create: (_) => sl<CartBloc>()),
        BlocProvider<OrderBloc>(create: (_) => sl<OrderBloc>()),
      ],
      child: MaterialApp(
        title: 'Hexashop',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xffF5F5F5),
          textTheme: GoogleFonts.interTextTheme(),
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => LoginPage(),
          '/register': (_) => RegisterPage(),
          '/home': (_) => HomePage(),
          '/cart': (_) => const CartPage(),
          '/order-tracking': (_) => const OrderTrackingPage(),
        },
      ),
    );
  }
}
