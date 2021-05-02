import 'package:ecommerce/events/product_event.dart';
import 'package:ecommerce/state/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  
  ProductBloc() : super(ProductStateInitial());

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) {
    
  }
}
