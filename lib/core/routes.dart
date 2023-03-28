import 'package:flutter/material.dart';

import '../auth_gate.dart';

/// All app routes
class AppRoutes {
  static final Map<String, Widget Function(BuildContext)> allRoutes = {
    AuthGate.routeName: (_) => const AuthGate(),
  };
}