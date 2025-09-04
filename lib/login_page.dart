import 'package:flutter/material.dart';
import 'package:todolist/controller/login_controller.dart';
import 'widgets/widget_textfield.dart';
import 'package:get/get.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  final LoginController controller = Get.find<LoginController>();

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
              Text(
                'Login',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),

              // Username Field
              textfield(
                hintText: "Username",
                controller: controller.usernameController,
              ),
              SizedBox(height: 20),

              // Password Field
              textfield(
                hintText: "Password",
                controller: controller.passwordController,
                obscureText: true,
              ),
              SizedBox(height: 30),

              ElevatedButton(
                onPressed: controller.login,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                ),
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
