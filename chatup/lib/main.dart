import'package:chatup/pages/register_page.dart';
import'package:chatup/themes/light_mode.dart';
import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'auth/login_or_register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitiallized(),
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
      theme:lightMode,
    );
  }
}
