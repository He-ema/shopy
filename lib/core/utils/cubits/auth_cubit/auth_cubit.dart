import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import '../../../../constants.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  bool signedWithGoogle = true;
  String? email;
  final CollectionReference _users =
      FirebaseFirestore.instance.collection(kUsersCollectionReference);

  Future<void> signInwithEmail({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(AuthLoading());
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await createUser(
        email: email,
        name: name,
        verified: false,
      );
      this.email = email;
      signedWithGoogle = false;
      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(AuthFailure(
            erroHeader: 'Weak Password',
            errorMessage: 'This Password is Too weak'));
      } else if (e.code == 'email-already-in-use') {
        emit(AuthFailure(
            erroHeader: 'Email Already exists',
            errorMessage: 'This email is already used'));
      }
    } catch (e) {
      emit(AuthFailure(
          erroHeader: 'Error',
          errorMessage: 'Something went wrong , try again'));
    }
  }

  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(AuthFailure(
            erroHeader: 'User not found',
            errorMessage: 'The Email You entered doesn\'t match a user'));
      } else if (e.code == 'wrong-password') {
        emit(AuthFailure(
            erroHeader: 'Wrong password',
            errorMessage: 'This password is wrong'));
      }
    } catch (e) {
      emit(AuthFailure(
          erroHeader: 'Error',
          errorMessage: 'Something went wrong , try again'));
    }
  }

  dynamic signInWithGoogle() async {
    emit(AuthLoading());
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      var doc = _users.doc(googleUser!.email);
      await doc.get().then((doc) async {
        if (doc.exists) {
          await createUser(
            email: googleUser!.email,
            name: googleUser.displayName!,
            image: googleUser.photoUrl,
            verified: true,
          );
        } else {}
      });
      email = googleUser.email;
      signedWithGoogle = true;
      emit(AuthSuccess());
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      emit(AuthFailure(
          erroHeader: 'Error',
          errorMessage: 'Something went wrong , try again'));
    }
  }

  Future<void> createUser({
    required String email,
    required String name,
    required bool verified,
    @required String? image,
  }) async {
    emit(AuthLoading());
    try {
      await _users.doc(email).set({
        kName: name,
        kEmail: email,
        kImage: image ??
            'https://firebasestorage.googleapis.com/v0/b/shopy-7831e.appspot.com/o/avatar.png?alt=media&token=05347550-2843-41d0-9251-a907316f4823',
        kVerified: verified,
      });
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(
          erroHeader: 'Error',
          errorMessage: 'Something went wrong , try again'));
    }
  }
}
