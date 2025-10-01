import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pizza_app/core/utils/styles.dart';
import 'package:pizza_app/core/widgets/custom_button_for_socialmedia_connectio.dart';
import 'package:pizza_app/features/auth/presentation/views/widgets/register_form.dart';

import 'package:pizza_app/features/auth/presentation/views/widgets/register_header_section.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: ListView(
        children: [
          const RegisterHeaderSection(),
          const SizedBox(height: 30),

          const RegisterForm(),

          const SizedBox(height: 10),

          const SizedBox(height: 15),
          const Text(
            " By Signing up you agree to our Terms Conditions & Privacy Policy.",
            style: Styles.textStyle16,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          Text(
            'Or',
            style: Styles.textStyle18.copyWith(color: Colors.grey.shade600),
            textAlign: TextAlign.center,
          ),
          const CustomButtonForSocialMediaConnection(
            icon: FontAwesomeIcons.facebookF,
            backgroundcolor: Color(0xff395998),
            textcolor: Colors.white,
            text: 'CONNECT WITH FACEBOOK',
          ),
          const SizedBox(height: 10),
          const CustomButtonForSocialMediaConnection(
            icon: FontAwesomeIcons.google,
            backgroundcolor: Color(0xff4285f4),
            textcolor: Colors.white,
            text: 'CONNECT WITH GOOGLE',
          ),
        ],
      ),
    );
  }
}
