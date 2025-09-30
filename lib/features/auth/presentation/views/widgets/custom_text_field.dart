import 'package:flutter/material.dart';
import 'package:pizza_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, this.hintText, this.icon});
  final String? hintText;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.black), // password text color
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 14.0),
          child: IconButton(
            icon: Icon(icon , size: 18,),
            onPressed: () {},
            color: kMediumGreyColor,
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey.shade500), // grey placeholder

        filled: true,
        fillColor: const Color(0xfff7f7f7), // background color of field
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none, // no border line
        ),
      ),
    );
  }
}
