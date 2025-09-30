import 'package:flutter/material.dart';
import 'package:pizza_app/core/utils/styles.dart';

class RegisterHeaderSection extends StatelessWidget {
  const RegisterHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Create Account", style: TextStyle(fontSize: 34)),
        Text.rich(
          TextSpan(
            children: [
              const TextSpan(
                text: "Enter your Name, Email and Password for sign up.",
                style: Styles.textStyle16,
              ),
              TextSpan(
                text: " Already have account?",
                style: Styles.textStyle16.copyWith(
                  color: const Color(0xff52b77d),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
