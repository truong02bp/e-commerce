import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../size_config.dart';

class FormError extends StatelessWidget {
  final List<String> errors;

  FormError({@required this.errors});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          errors.length, (index) => generateError(error: errors[index])),
    );
  }

  Row generateError({error}) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/icons/Error.svg",
          height: getProportionateHeight(18),
        ),
        SizedBox(
          height: getProportionateHeight(18),
          width: getProportionateWidth(10),
        ),
        Text(
          error,
          style:
          TextStyle(color: Colors.red, fontSize: getProportionateWidth(15)),
        )
      ],
    );
  }
}