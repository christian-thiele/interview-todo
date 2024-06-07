import 'dart:convert';

import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Log-In'),
            TextField(),
            TextField(
              obscureText: true,
              obscuringCharacter: utf8.decode([0xE2, 0x80, 0xA2]),
            ),
            Text('Ein Fehler ist aufgetreten: ...'),
            ElevatedButton(
              child: const Text('Sign In'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
