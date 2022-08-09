import 'package:chat/screen/screen.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  // 'users': (_) => const UsersScreen(),
  'loading': (_) => const LoadingScreen(),
  'Login': (_) => const LoginScreen(),
  'register': (_) => const RegisterScreen(),
  'chat': (_) => const ChatScreen()
};
