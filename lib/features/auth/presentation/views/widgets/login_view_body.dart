import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pizza_app/core/utils/styles.dart';
import 'package:pizza_app/core/widgets/custom_button_for_socialmedia_connectio.dart';
import 'package:pizza_app/features/auth/presentation/views/register_view.dart';
import 'package:pizza_app/features/auth/presentation/views/widgets/login_form.dart';
import 'package:pizza_app/features/auth/presentation/views/widgets/login_header_section.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: ListView(
        children: [
          const LoginHeaderSection(),
          const SizedBox(height: 30),
          const LoginForm(),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have account?", style: Styles.textStyle14),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const RegisterView();
                      },
                    ),
                  );
                },
                child: const Text(
                  '  Create new account.',
                  style: TextStyle(color: Color(0xff52b77d)),
                ),
              ),
            ],
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
