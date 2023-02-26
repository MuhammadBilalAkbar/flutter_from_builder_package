import 'package:flutter/material.dart';

import 'pages/form_builder_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Form Builder Demo',
        theme: ThemeData(
          primarySwatch: Colors.lightGreen,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            titleTextStyle: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
            ),
            iconTheme: IconThemeData(color: Colors.white),
          ),
          textTheme: const TextTheme(
            labelLarge: TextStyle(fontSize: 30),
            titleMedium: TextStyle(fontSize: 30),
            bodySmall: TextStyle(fontSize: 20),
            bodyLarge: TextStyle(fontSize: 30),
            bodyMedium: TextStyle(fontSize: 25),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        home: const FormBuilderPage(title: 'Flutter Form Builder'),
      );
}
