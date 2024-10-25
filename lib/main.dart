import 'package:bancofinandina/config/theme/AppTheme.dart';
import 'package:bancofinandina/presentation/Screens/InicioApp.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme(chosecolor: 1).theme(),
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: const InicioApp()
    );
  }
}