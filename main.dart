import 'package:cookbook/screen/view/sign_in.dart';
import 'package:cookbook/screen/viewmodel/view_model_ai.dart';
import 'package:cookbook/screen/viewmodel/view_model_daftar_masakan.dart';
import 'package:cookbook/screen/viewmodel/view_model_nav_bar.dart';
import 'package:cookbook/screen/viewmodel/view_model_signin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  final ai = AiViewModel();
  runApp(const MyApp());
  await ai.tokenAi();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => DaftarMasakanViewModel()),
          ChangeNotifierProvider(create: (_) => AiViewModel()),
          ChangeNotifierProvider(create: (_) => NavBarViewModel()),
          ChangeNotifierProvider(create: (_) => SignInViewModel()),
        ],
        child: MaterialApp(
          theme: ThemeData(
            brightness: Brightness.dark,
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFF484F88),
            ),
          ),
          debugShowCheckedModeBanner: false,
          home: const SignIn(),
        ));
  }
}
