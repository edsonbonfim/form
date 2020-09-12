import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'controller/auth_controller.dart';

void main() {
  runApp(
    Provider(
      create: (_) => AuthController(),
      child: App(),
    ),
  );
}
