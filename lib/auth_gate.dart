import 'package:flutter/material.dart';

import 'pages/home/home_page.dart';
import 'pages/login/auth_form.dart';

class AuthGate extends StatelessWidget {
  static const String routeName = '/';

  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // todo: handle auth state
    return true ? HomePage() : const AuthForm();
  }
}
