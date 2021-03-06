import 'package:appislas/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardIn extends StatefulWidget {
  

  @override
  State<CardIn> createState() => _CardInState();
}

class _CardInState extends State<CardIn> {
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
                dimesion.a = 0;
                dimesion.crearMatriz();
                dimesion.llenarLista();
                print('numero de islas ${dimesion.islas}');
                print('lista de datos ${dimesion.datos}');
              }, 
              child: const Text('Crear', style: TextStyle(color: Colors.white),),),

            Container(
              width: 100,
              height: 100,
              child: Text('numero de islas ${dimesion.islas}', textAlign: TextAlign.center),
            )
          ],
        ),
      ),
    );
  }
}

