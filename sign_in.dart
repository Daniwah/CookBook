// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables, use_build_context_synchronously

import 'package:cookbook/screen/view/widget/nav_bottom.dart';
import 'package:cookbook/screen/view/widget/textfield_login.dart';
import 'package:cookbook/screen/viewmodel/view_model_signin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SignInViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.asset(
                "assets/cookbook.jpg",
                fit: BoxFit.fill,
              ),
              Form(
                key: viewModel.formKey,
                child: Column(
                  children: [
                    customTextFormField(
                        controller: viewModel.email,
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Color(0xFF484F88),
                          size: 18,
                        ),
                        labelText: "Email",
                        validator: (value) => viewModel.validateEmail(value!)),
                    const SizedBox(height: 5),
                    customTextFormField(
                        controller: viewModel.password,
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Color(0xFF484F88),
                          size: 18,
                        ),
                        labelText: "Password",
                        obscureText: true,
                        validator: (value) =>
                            viewModel.validatePassword(value!)),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: const Color(0xFF484F88),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () async {
                        if (viewModel.formKey.currentState!.validate()) {
                          await viewModel.signIn();
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => const BottomNavScreen(),
                            ),
                            (route) => false,
                          );
                        }
                        viewModel.email.clear();
                        viewModel.password.clear();
                      },
                      child: const SizedBox(
                          width: double.infinity,
                          child: Center(
                              child: Text(
                            "Masuk",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ))),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
