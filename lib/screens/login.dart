import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/widgets/email_form.dart';
import 'package:flutter_firebase_login/widgets/google_form.dart';
import 'package:flutter_firebase_login/widgets/kakao_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 36, horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              EmailForm(),
              SizedBox(height: 8),
              GoogleForm(),
              SizedBox(height: 8),
              KakaoForm(),
            ],
          ),
        ),
      ),
    );
  }
}
