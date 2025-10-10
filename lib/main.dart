import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_app/constants.dart';
import 'package:pizza_app/features/auth/data/repos/user_repo_impl.dart';
import 'package:pizza_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:pizza_app/features/auth/presentation/views/login_view.dart';
import 'package:pizza_app/features/home/presentation/views/home_view.dart';
import 'package:pizza_app/firebase_options.dart';
import 'package:pizza_app/simple_bloc_observer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Supabase.initialize(
  url: 'https://panynadpchoxcwotqbli.supabase.co',
  anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBhbnluYWRwY2hveGN3b3RxYmxpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTk4Mjg3NzIsImV4cCI6MjA3NTQwNDc3Mn0.WSNUPc9zeLGgmP-o07SI6J22_61Z7aNqr4dUyUSZUq4',
);
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
        home: const HomeView(),
      ),
    );
  }
}
