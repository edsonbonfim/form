import 'package:example/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<AuthController>(context);
    final auth = authController.auth;

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: authController.logout,
          ),
        ],
      ),
      body: Center(
        child: Text("Welcome, ${auth.username}!"),
      ),
    );
  }
}
