import 'package:first_app/auth/auth.dart';
import 'package:first_app/screens/lesson/lesson_screen.dart';
import 'package:first_app/screens/home/home.dart';
import 'package:first_app/screens/home/perfin.dart';
import 'package:first_app/screens/levels/leccion1.dart';
import 'package:first_app/screens/levels/levels.dart';
import 'package:first_app/screens/log/forgot_password.dart';
import 'package:first_app/screens/log/login.dart';
import 'package:first_app/screens/log/signup.dart';
import 'package:first_app/screens/welcome/welcome.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  Auth.routeName: (context) => const Auth(),
  WelcomeScreen.routeName: (context) => const WelcomeScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  PerfilScreen.routeName: (context) => const PerfilScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  ChangePasswordScreen.routeName: (context) => const ChangePasswordScreen(),
  LeccionScreen.routeName: (context) => const LeccionScreen(),
  LevelsScreen.routeName: (context) => const LevelsScreen(),
  LessonScreen.routeName: (context) => const LessonScreen(),
};
