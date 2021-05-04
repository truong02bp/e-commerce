import 'package:ecommerce/blocs/category_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'components/body.dart';

class CategoryScreen extends StatelessWidget {
  static final String routeName = "/admin/categories";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: BlocProvider(
        create: (context) => CategoryBloc(),
        child: Body(),
      ),
    );
  }
}
