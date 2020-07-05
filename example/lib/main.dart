import 'package:example/app.dart';
import 'package:example/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    Provider(
      create: (_) => AuthController(),
      child: App(),
    ),
  );
}
