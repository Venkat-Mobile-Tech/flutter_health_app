import 'package:flutter/material.dart';
import 'core/dependency_injection/injection_container.dart'
    as dependency_injection;
import 'core/theme/app_theme.dart';
import 'health_chat_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependency_injection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health Chat App',
      theme: AppTheme.theme,
      home: const HealthChatApp(),
    );
  }
}
