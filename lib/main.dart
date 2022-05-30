import 'package:appislas/aplication.dart';
import 'package:appislas/provider.dart';
import 'package:appislas/providerColor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Dimension()),
        ChangeNotifierProvider(create: (context) => ColorContainerProvaider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'App Islas',
        home: Aplication(),
      ),
    );
  }
}
