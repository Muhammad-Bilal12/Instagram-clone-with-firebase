import 'package:flutter/material.dart';

class TextInputFeild extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final bool isPass;

  const TextInputFeild({
    Key? key,
    required this.hintText,
    required this.textInputType,
    required this.textEditingController,
    this.isPass = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
    );
    return TextField(
      controller: textEditingController,
      keyboardType: textInputType,
      obscureText: isPass,
      decoration: InputDecoration(
        border: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        hintText: hintText,
      ),
    );
  }
}
