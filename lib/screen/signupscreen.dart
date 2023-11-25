import 'package:flutter/material.dart';
import 'package:google_apple_signin_flutter/core/auth/userAuth.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        centerTitle:true
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                UserAuth(). signInWithGoogle(context);
                // Handle Gmail Sign Up
                // You can add your logic here
              },
              icon: Image.asset('assets/images/google_logo.png', height: 24.0),
              label: const Text('Sign Up with Gmail'),
            ),
           const SizedBox(height: 16.0),
            ElevatedButton.icon(
              onPressed: () {
                UserAuth(). signInWithApple(context);

                // Handle Apple Sign Up
                // You can add your logic here
              },
              icon: Image.asset('assets/images/apple_logo.png', height: 24.0),
              label:const Text('Sign Up with Apple'),
            ),
          ],
        ),
      ),
    );
  }
}


