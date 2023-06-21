import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_library/controller/signup_controller.dart';
import 'package:personal_library/view/screens/signin_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  SignupController signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignUp'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: signupController.nameController,
              decoration: InputDecoration(
                hintText: 'Name',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: signupController.emailController,
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
              controller: signupController.passwordController,
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
                onPressed: () {
                  signupController.signupUserWithEmail();
                },
                child: const Text('Sign up')),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(() => const SigninScreen());
                },
                child: const Text('Go to Login')),
          ],
        ),
      ),
    );
  }
}
