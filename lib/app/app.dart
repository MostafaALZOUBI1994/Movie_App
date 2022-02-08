import 'package:flutter/material.dart';
import 'package:movie_app/app/ui/screen/main_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MainScreen(),
    );
  }
}
