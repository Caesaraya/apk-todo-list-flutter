import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controller/login_controller.dart';
import 'package:todolist/widgets/widget_button.dart';
import 'package:todolist/widgets/widget_textfield.dart';

class LoginApp extends StatelessWidget{
  LoginApp({super.key});

  final loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.yellow[700],
                      child: const Icon(
                        Icons.lock_outline,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 20),
                      child: Text(
                        'Selamat Datang',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        'Silakan login untuk melanjutkan',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                    // Username Field
                    Container(
                      margin: EdgeInsets.only(top: 10,bottom: 10),
                      child: CustomTextField(
                        hintText: "Username",
                        controller: loginController.usernameController,
                        prefixIcon: Icons.person,
                      ),
                    ),
                    // Password Field
                    Container(
                      margin: EdgeInsets.only(top: 10,bottom: 10),
                      child: CustomTextField(
                        hintText: "Password",
                        controller: loginController.passwordController,
                        obscureText: true,
                        prefixIcon: Icons.lock,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: CustomButton(
                        textColor: Colors.brown,
                        onPressed: loginController.login
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
