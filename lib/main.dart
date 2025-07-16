import 'package:delivery_app/features/auth/presentation/views/login_or_rigister.dart';
import 'package:delivery_app/features/home/data/models/restaurant_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'themes/theme_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),

        ChangeNotifierProvider(create: (context) => RestaurantModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginOrRigister(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
