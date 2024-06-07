import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'pages/sign_in_page.dart';
import 'services/api_service/api_service.dart';

void main() {
  GetIt.instance.registerSingleton<ApiService>(ApiService());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Interview Test ToDo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightBlue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const SignInPage(),
    );
  }
}
