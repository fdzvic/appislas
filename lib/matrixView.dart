import 'dart:ffi';

import 'package:appislas/algorithmLogic.dart';
import 'package:appislas/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MatrixView extends StatefulWidget {

  @override
  State<MatrixView> createState() => _MatrixViewState();
}

class _MatrixViewState extends State<MatrixView> {

  @override
  Widget build(BuildContext context) {

    final dimension = Provider.of<Dimension>(context);

    return Center(
      child: GridView.builder(
        
        shrinkWrap: true,
        itemCount: dimension.dimension * dimension.dimension,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: dimension.dimension,
          ) , 
        itemBuilder: (context, index){
              return Padding(
                  padding: const EdgeInsets.all(1),
                  child: Container(
                      width: 30,
                      height: 30,
                      color: dimension.colorElegido(),
                      child: MaterialButton(
                        child: Text('$index'),
                        onPressed: (){
                          print(dimension.datos);
                          (dimension.datos[index] == 0) ? dimension.datos[index] = 1 : dimension.datos[index] = 0; 
                          print(dimension.datos);
                          setState(() {
                          });
                        }),
                      ),
                    );      
        },
        ),
    );
  }
}