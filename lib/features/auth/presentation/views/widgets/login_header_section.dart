
import 'package:flutter/material.dart';
import 'package:pizza_app/core/utils/styles.dart';

class LoginHeaderSection extends StatelessWidget {
  const LoginHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Welcome", style: TextStyle(fontSize: 34)),
        Text("Enter your Email to sign in.", style: Styles.textStyle16),
        Text("Enjoy your food :)", style: Styles.textStyle16),
      ],
    );
  }
}
