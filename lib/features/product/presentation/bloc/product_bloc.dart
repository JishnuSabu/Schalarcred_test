import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_event.dart';
import 'product_state.dart';
import 'package:scholarcred_test/features/product/domain/entities/product.dart';
import 'package:scholarcred_test/core/images_path/images.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<FetchProducts>((event, emit) async {
      emit(ProductLoading());

      await Future.delayed(const Duration(seconds: 1)); // simulate loading

      try {
        // Hardcoded products
        final menProducts = [
          Product(
            id: '1',
            name: 'Classic Spring',
            price: 120.0,
            image: Images.men2,
            rating: 5.0,
            category: 'men',
          ),
          Product(
            id: '2',
            name: 'Classic Spring',
            price: 120.0,
            image: Images.men3,
            rating: 5.0,
            category: 'men',
          ),
          Product(
            id: '3',
            name: 'Classic Spring',
            price: 120.0,
            image: Images.men4,
            rating: 5.0,
            category: 'men',
          ),
          Product(
            id: '4',
            name: 'Classic Spring',
            price: 120.0,
            image: Images.men5,
            rating: 5.0,
            category: 'men',
          ),
        ];

        final womenProducts = [
          Product(
            id: '5',
            name: 'Classic Spring',
            price: 120.0,
            image: Images.women2,
            rating: 5.0,
            category: 'women',
          ),
          Product(
            id: '6',
            name: 'Classic Spring',
            price: 120.0,
            image: Images.women3,
            rating: 5.0,
            category: 'women',
          ),
          Product(
            id: '7',
            name: 'Classic Spring',
            price: 120.0,
            image: Images.women4,
            rating: 5.0,
            category: 'women',
          ),
          Product(
            id: '8',
            name: 'Classic Spring',
            price: 120.0,
            image: Images.women2,
            rating: 5.0,
            category: 'women',
          ),
        ];

        final kidProducts = [
          Product(
            id: '9',
            name: 'Classic Spring',
            price: 120.0,
            image: Images.kid2,
            rating: 5.0,
            category: 'kid',
          ),
          Product(
            id: '10',
            name: 'Classic Spring',
            price: 120.0,
            image: Images.kid3,
            rating: 5.0,
            category: 'kid',
          ),
          Product(
            id: '11',
            name: 'Classic Spring',
            price: 120.0,
            image: Images.kid4,
            rating: 5.0,
            category: 'kid',
          ),
          Product(
            id: '12',
            name: 'Classic Spring',
            price: 120.0,
            image: Images.kid5,
            rating: 5.0,
            category: 'kid',
          ),
        ];

        final allProducts = [...menProducts, ...womenProducts, ...kidProducts];

        emit(ProductLoaded(allProducts));
      } catch (e) {
        emit(ProductError('Failed to load products'));
      }
    });
  }
}
