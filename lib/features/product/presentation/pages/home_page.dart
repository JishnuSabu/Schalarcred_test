import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholarcred_test/core/responsive/responsive.dart';
import 'package:scholarcred_test/features/product/presentation/bloc/product_bloc.dart';
import 'package:scholarcred_test/features/product/presentation/bloc/product_state.dart';
import 'package:scholarcred_test/features/product/presentation/pages/explore_products_section.dart';
import 'package:scholarcred_test/features/product/presentation/pages/footer_section.dart';
import 'package:scholarcred_test/features/product/presentation/pages/hexa_shop_advertisement_section.dart';
import 'package:scholarcred_test/features/product/presentation/pages/product_list_view.dart';
import 'package:scholarcred_test/features/product/presentation/pages/social_media_section.dart';
import 'package:scholarcred_test/features/product/presentation/pages/widgets/hexa_shop_logo.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            HexaShopAdvertisementSection(),
            const SizedBox(height: 40),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ProductError) {
                  return Center(child: Text(state.message));
                } else if (state is ProductLoaded) {
                  final menProducts = state.products
                      .where((p) => p.category == 'men')
                      .toList();
                  final womenProducts = state.products
                      .where((p) => p.category == 'women')
                      .toList();
                  final kidProducts = state.products
                      .where((p) => p.category == 'kid')
                      .toList();

                  return Column(
                    children: [
                      ProductListSection(
                        title: "Men's Latest",
                        subtitle:
                            "Lorem Ipsum is simply dummy text of the printingand typesetting industry.",
                        products: menProducts,
                      ),
                      const SizedBox(height: 40),
                      ProductListSection(
                        title: "Women's Latest",
                        subtitle:
                            "Lorem Ipsum is simply dummy text of the printingand typesetting industry.",
                        products: womenProducts,
                      ),
                      const SizedBox(height: 40),
                      ProductListSection(
                        title: "Kid's Latest",
                        subtitle:
                            "Lorem Ipsum is simply dummy text of the printingand typesetting industry.",
                        products: kidProducts,
                      ),
                    ],
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
            const SizedBox(height: 40),
            const ExploreProductsSection(),
            const SizedBox(height: 40),
            SocialMediaSection(),
            const SizedBox(height: 40),
            FooterSection(),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget? _buildAppBar(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < ResponsiveConstants.tabletBreakpoint) {
      // Mobile: Drawer menu
      return AppBar(
        backgroundColor: Color(0xFFD9D9D9),
        title: HexashopLogo(
          textClr: Color(0xFFFFFFFF),
          logoClr: Color(0xFF000000),
          companyNameClr: Color(0xFF000000),
          companyCategryClr: Color(0xFF000000),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
          ),
        ],
      );
    } else {
      // Tablet and Desktop: Horizontal menu
      return null; // No AppBar for larger screens
    }
  }
}
