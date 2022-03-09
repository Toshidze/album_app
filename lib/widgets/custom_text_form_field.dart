import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String postItem;
  const CustomTextFormField({
    Key? key,
    required this.postItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: postItem,
        hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.zero,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
