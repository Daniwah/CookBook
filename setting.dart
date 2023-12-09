// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:cookbook/screen/view/sign_in.dart';
import 'package:cookbook/screen/viewmodel/view_model_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class setting extends StatelessWidget {
  const setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final modelview = Provider.of<NavBarViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Setting"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: const Color(0xFF484F88),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () async {
                  //if (viewModel.formKey.currentState!.validate()) {
                  //await viewModel.signIn();
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const SignIn(),
                    ),
                    (route) => false,
                  );
                  modelview.aturulang();
                  //}
                },
                child: const SizedBox(
                    width: double.infinity,
                    child: Center(
                        child: Text(
                      "Logout",
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
      ),
    );
  }
}
