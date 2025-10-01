import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_app/core/widgets/custom_button.dart';
import 'package:pizza_app/core/widgets/show_snackbar.dart';
import 'package:pizza_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:pizza_app/features/auth/presentation/views/login_view.dart';
import 'package:pizza_app/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:pizza_app/features/auth/presentation/views/widgets/has_active_cart_checkbox.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

String? name;
String? email;
String? password;
bool hasActiveCart = false;

AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
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
            controller: _nameController,
            hintText: "Full Name",
            onChanged: (value) {
              name = value;
            },
          ),
          const SizedBox(height: 10),
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
          HasActiveCartCheckbox(
            initialValue: false, // default value
            onChanged: (value) {
              hasActiveCart = value;
              // debugPrint("HasActiveCart = $value");
              // Here value is true/false
            },
          ),

          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is RegisterSuccess) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const LoginView();
                      },
                    ),
                  );
                  _emailController.clear();
                  _passwordController.clear();
                  _nameController.clear();
                  setState(() => hasActiveCart = false);
                  ShowSnackBar(context, "Registered Successfully");
                } else if (state is RegisterFailure) {
                  ShowSnackBar(context, state.errorMessege);
                }
              },
              builder: (context, state) {
                return CustomButton(
                  isLoading: state is RegisterLoading ? true : false,
                  backgroundcolor: const Color(0xff22a45d),
                  textcolor: Colors.white,
                  text: 'SIGN Up',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<AuthCubit>(context).registerUser(
                        email: email!,
                        password: password!,
                        name: name!,
                        hasActiveCart: hasActiveCart,
                      );
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
