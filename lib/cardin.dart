import 'package:appislas/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardIn extends StatelessWidget {
  

  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dimesion = Provider.of<Dimension>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blue,
            width: 5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: textController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Ingrese dimension',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: (){
                      textController.clear();
                    },
                    ) 
                  ),
              ),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: (){
                dimesion.dimension = int.parse(textController.text);
              }, 
              child: const Text('Crear', style: TextStyle(color: Colors.white),),)
          ],
        ),
      ),
    );
  }
}

