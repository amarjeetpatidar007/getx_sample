import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../routes.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  static AuthController instance = Get.find();
  GoogleSignIn googleSign = GoogleSignIn();
  late Rx<User?> user;

  // @override
  // void onReady(){
  //   super.onReady();
  //   _user = Rx<User?>(auth.currentUser);
  //   _user.bindStream(auth.userChanges());
  //   ever(_user, _initialScreen);
  // }

  @override
  void onInit() {
    user = Rx<User?>(auth.currentUser);
    user.bindStream(auth.authStateChanges());
    ever(user, _initialScreen);
    super.onInit();
  }

  _initialScreen(User? user) {
    if (user == null) {
      print("login page");
      Get.offAllNamed(Routes.getLoginPage());
    } else {
      Get.offAllNamed(Routes.getHomeRoute());
    }
  }

  registerWithEmailAndPassword(String email, password) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => Get.snackbar(
                "User Created!",
                "Login To Continue",
                snackPosition: SnackPosition.BOTTOM,
              ));
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
      print(e.toString());
    }
  }

  loginWithEmailAndPassword(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.message!);
    }
  }

  signInWithGoogle() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await googleSign.signIn();

      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken);

        await auth
            .signInWithCredential(credential)
            .catchError((onError) => print(onError));
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
      print(e.toString());
    }
  }

  signOut() async {
    await auth.signOut();
  }
}
