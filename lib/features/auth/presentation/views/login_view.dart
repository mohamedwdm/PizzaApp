import 'package:flutter/material.dart';
import 'package:pizza_app/features/auth/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: const SafeArea(child: LoginViewBody()),
    );
  }
}
