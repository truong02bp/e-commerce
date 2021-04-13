import 'package:flutter/material.dart';

class InputCard extends StatelessWidget {
  final bool readOnly;
  final String initialValue;
  final String prefixText;
  Function onChange;
  InputCard({this.onChange, this.initialValue, this.prefixText, this.readOnly});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChange,
      readOnly: readOnly,
      initialValue: initialValue,
      decoration: inputDecoration(prefixText: prefixText),
      textAlign: TextAlign.end,
    );
  }
  static InputDecoration inputDecoration({prefixText}) {
    return InputDecoration(
      focusedBorder:
          UnderlineInputBorder(borderRadius: BorderRadius.circular(25)),
      enabledBorder:
          UnderlineInputBorder(borderRadius: BorderRadius.circular(25)),
      errorBorder:
          UnderlineInputBorder(borderRadius: BorderRadius.circular(25)),
      disabledBorder:
          UnderlineInputBorder(borderRadius: BorderRadius.circular(25)),
      prefixText: prefixText,
      prefixStyle: TextStyle(
        color: Colors.black.withOpacity(0.45),
      ),
    );
  }
  
}