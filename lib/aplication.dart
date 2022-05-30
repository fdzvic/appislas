import 'package:appislas/cardin.dart';
import 'package:appislas/matrixView.dart';
import 'package:flutter/material.dart';

class Aplication extends StatefulWidget {
  const Aplication({
    Key? key,
  }) : super(key: key);

  @override
  State<Aplication> createState() => _AplicationState();
}

class _AplicationState extends State<Aplication> {

  final TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('App Islas'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CardIn(),
            MatrixView(),
          ],
        ),
      )

    );
  }
}

