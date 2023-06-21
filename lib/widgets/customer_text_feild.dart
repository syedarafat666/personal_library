// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomerTextFeild extends StatelessWidget {
  CustomerTextFeild({
    super.key,
    required this.textController,
    required this.hintText,
    this.keyboardType,
  });

  TextEditingController textController = TextEditingController();
  final String hintText;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }
}
