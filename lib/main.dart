import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_app/constants.dart';
import 'package:pizza_app/features/auth/data/models/repos/user_repo_impl.dart';
import 'package:pizza_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:pizza_app/features/auth/presentation/views/login_view.dart';
import 'package:pizza_app/firebase_options.dart';
import 'package:pizza_app/simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = SimpleBlocObserver();
  runApp(const PizzaApp());
}

class PizzaApp extends StatelessWidget {
  const PizzaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(UserRepoImpl()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "pizza delivery",
        theme: ThemeData(
          colorScheme: ColorScheme.light(
            surface: kPrimaryColor,
            onSurface: Colors.black,
            primary: Colors.blue,
            onPrimary: Colors.white,
          ),
        ),
        home: LoginView(),
      ),
    );
  }
}
