import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:pizza_app/features/auth/models/user_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> RegisterUser({
    required String email,
    required String password,
    required String name,
    required bool hasActiveCart,
  }) async {
    emit(RegisterLoading());
    try {
      // Step 1: Create account in Firebase Auth
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      // Step 2: Save user profile in Firestore
      if (user != null) {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'userid': user.uid,
          'name': name,
          'email': email,
          'hasActiveCart': hasActiveCart,
          'createdAt': FieldValue.serverTimestamp(),
        });
      }

      print("✅ User registered & profile saved!");
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFailure(errorMessege: "The password provided is too weak."));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailure(errorMessege: 'The account already exists for that email.'));
      }
    } on Exception catch (e) {
      emit(RegisterFailure(errorMessege: "Something went wrong"));
    }
  }

  Future<UserModel?> LoginUser({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      // Step 1: Sign in with Firebase Auth
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      if (user != null) {
        print("✅ Signed in as: ${user.email}");

        // Step 2: Get user profile from Firestore (optional)
        DocumentSnapshot userDoc =
            await FirebaseFirestore.instance.collection('users').doc(user.uid).get();

        if (userDoc.exists) {
          print("📂 User profile: ${userDoc.data()}");
          emit(LoginLoading());
          return UserModel.fromJson(userDoc.data()!);
        } else {
          print("⚠️ No profile found in Firestore!");
        }
      }
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'user-not-found') {
        emit(LoginFailure(errorMessege: "No user found for that email"));
      } else if (ex.code == 'wrong-password') {
        emit(LoginFailure(errorMessege: 'Wrong password provided for that user.'));
      }
    } on Exception catch (e) {
      emit(LoginFailure(errorMessege: "Something went wrong"));
    }
  }

  Future<void> LogOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
