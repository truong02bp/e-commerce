import 'package:ecommerce/events/category_event.dart';
import 'package:ecommerce/model/category.dart';
import 'package:ecommerce/service/category_service.dart';
import 'package:ecommerce/state/category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryStateInital());

  CategoryService categoryService = CategoryService.getInstance();

  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    if (event is CategoryEventGetAll) {
      yield CategoryStateLoading();
      List<Category> categories = await categoryService.getAll(
          size: event.size, currentPage: event.currentPage);
      yield CategoryStateFetchSuccess(categories: categories);
    }
  }
}
