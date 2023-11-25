import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_apple_signin_flutter/core/auth/firebaseDatabase.dart';
import 'package:google_apple_signin_flutter/screen/dashboardScreen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:the_apple_sign_in/scope.dart';
import 'package:the_apple_sign_in/the_apple_sign_in.dart';

class UserAuth {
  final FirebaseAuth auth = FirebaseAuth.instance;

  getCurrentUser() async {
    return await auth.currentUser;
  }

  signInWithGoogle(BuildContext context) async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    final GoogleSignInAuthentication? googleSignInAuthentication =
        await googleSignInAccount?.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication?.idToken,
        accessToken: googleSignInAuthentication?.accessToken);

    UserCredential result = await firebaseAuth.signInWithCredential(credential);

    User? userDetails = result.user;

    Map<String, dynamic> userInfoMap = {
      "email": userDetails!.email,
      "name": userDetails.displayName,
      "imgUrl": userDetails.photoURL,
      "id": userDetails.uid,
    };
    debugPrint('save info into firebase-> ${userInfoMap.toString()}');
    FirebaseDatabase().addUser(userDetails.uid, userInfoMap).then((value) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) =>  Dashboard(name: userDetails.displayName, email: userDetails.email,)));
    });
    }

  Future<User> signInWithApple(BuildContext context,{List<Scope> scopes = const []}) async {
    final result = await TheAppleSignIn.performRequests(
        [AppleIdRequest(requestedScopes: scopes)]);

    switch (result.status) {
      case AuthorizationStatus.authorized:
        final appleIdCredential = result.credential!;
        final oAuthProvider = OAuthProvider('apple.com');
        final credential = oAuthProvider.credential(
            idToken: String.fromCharCodes(appleIdCredential.identityToken!));
        final userCredential = await auth.signInWithCredential(credential);
        final firebaseUser = userCredential.user!;
        if (scopes.contains(Scope.fullName)) {
          final fullName = appleIdCredential.fullName;
          debugPrint('get full name apple-> ${fullName.toString()}');
          if (fullName != null &&
              fullName.givenName != null &&
              fullName.familyName != null) {
            final displayName = '${fullName.givenName} ${fullName.familyName}';
            await firebaseUser.updateDisplayName(displayName);
          }
    Map<String, dynamic> userInfoMap = {
      "email": appleIdCredential.email,
      "name": appleIdCredential.fullName!.givenName,
      "imgUrl": 'apple logo not available',
      "id": appleIdCredential.identityToken,
    };
    debugPrint('save info into firebase-> ${userInfoMap.toString()}');
    FirebaseDatabase().addUser(appleIdCredential.identityToken.toString(), userInfoMap).then((value) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) =>  Dashboard(name: fullName!.givenName,email: appleIdCredential.email,)));
    });
        }
        return firebaseUser;
      case AuthorizationStatus.error:
        throw PlatformException(
            code: 'ERROR_AUTHORIZATION_DENIED',
            message: result.error.toString());

      case AuthorizationStatus.cancelled:
        throw PlatformException(
            code: 'ERROR_ABORTED_BY_USER', message: 'Sign in aborted by user');

      default:
        throw UnimplementedError();
    }
  }
}