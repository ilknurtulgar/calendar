import 'package:calendar/screen/login/view/login_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginView(),
      locale: const Locale('tr', 'TR'),
      theme: ThemeData(
          datePickerTheme: const DatePickerThemeData(
        dayStyle: TextStyle(fontSize: 10),
      )),
    );
  }
}
