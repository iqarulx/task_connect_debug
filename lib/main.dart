import 'dart:io';
import 'package:flutter/material.dart';
import 'package:task_connect_debug/services/local_db/local_db.dart';
import 'package:task_connect_debug/view/auth/login.dart';
import 'package:task_connect_debug/view/dashboard/dashboard.dart';
import 'package:task_connect_debug/view/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var isLogin = await LocalDBConfig().checkLogin();

  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp(isLogin: isLogin));
}

class MyApp extends StatelessWidget {
  final bool isLogin;
  const MyApp({super.key, required this.isLogin});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Task Connect",
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: colorScheme),
      ),
      home: isLogin ? const DashboardView() : const LoginView(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
