import 'package:ecommerce/blocs/category_bloc.dart';
import 'package:ecommerce/components/title_item.dart';
import 'package:ecommerce/events/category_event.dart';
import 'package:ecommerce/model/category.dart';
import 'package:ecommerce/screens/admin/categories/components/list_category.dart';
import 'package:ecommerce/size_config.dart';
import 'package:ecommerce/state/category_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final ScrollController _controller = ScrollController();

  List<Category> categories = List();

  CategoryBloc _categoryBloc;

  final int sizePage = 6;

  int currentPage = 0;

  bool isLoading = false;

  bool isAdd = false;

  @override
  void initState() {
    _categoryBloc = BlocProvider.of(context);
    _categoryBloc
        .add(CategoryEventGetAll(size: sizePage, currentPage: currentPage));
    currentPage = 1;
    _controller.addListener(() {
      scrollListener();
    });
  }

  void scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent / 2 &&
        !_controller.position.outOfRange) {
      print('â');
      _categoryBloc
          .add(CategoryEventGetAll(size: sizePage, currentPage: currentPage));
      setState(() {
        currentPage++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      cubit: _categoryBloc,
      listener: (context, state) {
        if (state is CategoryStateLoading) {
          setState(() {
            isLoading = true;
          });
        }
        if (state is CategoryStateFetchSuccess) {
          setState(() {
            categories.addAll(state.categories);
            isLoading = false;
          });
        }
      },
      child: Column(
        children: [
          Container(
            height: SizeConfig.screenHeight / 16,
            child: Row(
              children: [
                TitleItem(
                  title: 'List category',
                  width: SizeConfig.screenWidth / 2,
                  isPicked: !isAdd,
                  onPress: () {
                    setState(() {
                      isAdd = false;
                    });
                  },
                ),
                TitleItem(
                  title: 'Add new category',
                  width: SizeConfig.screenWidth / 2,
                  isPicked: isAdd,
                  onPress: () {
                    setState(() {
                      isAdd = true;
                    });
                  },
                ),
              ],
            ),
          ),
          (isAdd == false)
              ? Expanded(
                  child: ListCategory(
                      controller: _controller,
                      categories: categories,
                      isLoading: isLoading),
                )
              : Expanded(child: Container()),
        ],
      ),
    );
  }
}
