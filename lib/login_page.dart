import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controller/login_controller.dart';
import 'package:todolist/widgets/widget_textfield.dart';

class LoginApp extends GetView<LoginController> {
  LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Login',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),

              // Username Field
              textfield(
                hintText: "Username",
                controller: controller.usernameController,
                prefixIcon: Icons.person,
              ),
              const SizedBox(height: 20),

              // Password Field
              textfield(
                hintText: "Password",
                controller: controller.passwordController,
                obscureText: true,
                prefixIcon: Icons.lock,
              ),
              const SizedBox(height: 30),

              Obx(
                () => ElevatedButton(
                  onPressed: controller.isLoading.value
                      ? null
                      : controller.login,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 100,
                      vertical: 15,
                    ),
                  ),
                  child: controller.isLoading.value
                      ? const CircularProgressIndicator()
                      : const Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
