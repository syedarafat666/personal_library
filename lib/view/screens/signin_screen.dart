import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_library/controller/signin_controller.dart';
import 'package:personal_library/view/screens/signup_screen.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  SigninController signinController = Get.put(SigninController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignIn'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: signinController.emailController,
              decoration: InputDecoration(
                hintText: 'Email',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: signinController.passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
                onPressed: () async {
                  signinController.loginWithEmail();
                },
                child: const Text('Sign in')),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const SignupScreen());
              },
              child: const Text('Register yourself'),
            ),
          ],
        ),
      ),
    );
  }
}
