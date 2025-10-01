import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_app/core/utils/styles.dart';
import 'package:pizza_app/core/widgets/custom_button.dart';
import 'package:pizza_app/core/widgets/show_snackbar.dart';
import 'package:pizza_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:pizza_app/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:pizza_app/features/home/presentation/views/home_view.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

String? email;
String? password;

AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formKey,
      child: Column(
        children: [
          CustomTextField(
            controller: _emailController,
            hintText: "Email",
            onChanged: (value) {
              email = value;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Email is required";
              }
              final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
              if (!emailRegex.hasMatch(value)) {
                return "Enter a valid email";
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          CustomTextField(
            controller: _passwordController,
            hintText: "Password",
            isPassword: true,
            onChanged: (value) {
              password = value;
            },
          ),
          const SizedBox(height: 10),
          const Align(
            alignment: Alignment.centerRight,
            child: Text("Forget Password?", style: Styles.textStyle14),
          ),

          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const HomeView();
                      },
                    ),
                  );
                  //formkey1.currentState!.reset();
                  _emailController.clear();
                  _passwordController.clear();
                  ShowSnackBar(context, "Logged Successfully");
                } else if (state is LoginFailure) {
                  ShowSnackBar(context, state.errorMessege);
                }
              },
              builder: (context, state) {
                return CustomButton(
                  isLoading: state is LoginLoading ? true : false,
                  backgroundcolor: const Color(0xff22a45d),
                  textcolor: Colors.white,
                  text: 'SIGN IN',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<AuthCubit>(
                        context,
                      ).loginUser(email: email!, password: password!);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
