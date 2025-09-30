import 'package:flutter/material.dart';
import 'package:pizza_app/features/auth/presentation/views/widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        title: const Text("Create Account"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: const SafeArea(child: RegisterViewBody()),
    );
  }
}
