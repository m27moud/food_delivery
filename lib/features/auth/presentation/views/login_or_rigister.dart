import 'package:flutter/material.dart';

import 'login_view.dart';
import 'register_view.dart';

class LoginOrRigister extends StatefulWidget {
  const LoginOrRigister({super.key});

  @override
  State<LoginOrRigister> createState() => _LoginOrRigisterState();
}

class _LoginOrRigisterState extends State<LoginOrRigister> {
  bool showLogin = true;

  void toggleView() {
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLogin) {
      return LoginView(onTap: toggleView);
    } else {
      return RegisterView(onTap: toggleView);
    }
  }
}
