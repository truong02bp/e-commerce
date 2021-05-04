import 'package:ecommerce/constants/constants.dart';
import 'package:ecommerce/model/category.dart';
import 'package:ecommerce/screens/admin/categories/components/category_card.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

class ListCategory extends StatelessWidget {
  const ListCategory({
    Key key,
    @required ScrollController controller,
    @required this.categories,
    @required this.isLoading,
  }) : _controller = controller, super(key: key);

  final ScrollController _controller;
  final List<Category> categories;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(controller: _controller, children: [
        Column(
          children: List.generate(
              categories.length,
              (index) => CategoryCard(
                    category: categories[index],
                  )).toList(),
        ),
        buildLoading(isLoading: isLoading, color: Colors.white.withOpacity(0.95)),
      ]),
    );
  }
}