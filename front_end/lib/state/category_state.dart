import 'package:ecommerce/model/category.dart';

abstract class CategoryState {

}

class CategoryStateInital extends CategoryState {
  
}

class CategoryStateLoading extends CategoryState {
  
}

class CategoryStateFetchSuccess extends CategoryState {

  final List<Category> categories;

  CategoryStateFetchSuccess({this.categories});
  
}