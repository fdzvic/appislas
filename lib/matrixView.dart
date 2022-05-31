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

    final dimesion = Provider.of<Dimension>(context);
    final algorithm = AlgorithmLogic();
    List<List<int>> matrix = algorithm.crearMatriz(dimesion.dimension);
    algorithm.recorrerMatriz(dimesion.dimension, matrix, algorithm.islas);
    dimesion.islas = algorithm.islas.length;
    List nume = [];

    llenarLista(){
    for (int i = 0; i < dimesion.dimension; i++) {
      for (int j = 0; j < dimesion.dimension; j++) {
        nume.add(matrix[i][j]);
      } 
    }
    print('lista de la matriz $nume');
    }
    int a = 0;
    colorElegido(){
      for (int i = a; i < dimesion.dimension*dimesion.dimension; i++) {
        int valor = nume[i];
        if(valor == 1){
          a++;
          return Colors.yellow;
        }else{
          a++;
          return Colors.blue;
        }        
      }
      return Colors.blue;
    }

    setState(() {
      llenarLista();
    });
 

    return Center(
      child: GridView.builder(
        
        shrinkWrap: true,
        itemCount: dimesion.dimension * dimesion.dimension,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: dimesion.dimension,
          ) , 
        itemBuilder: (context, index){
              return Padding(
                  padding: const EdgeInsets.all(1),
                  child: Container(
                      width: 30,
                      height: 30,
                      color: colorElegido(),
                      child: MaterialButton(
                        child: Text('$index'),
                        onPressed: (){
                          print(nume);
                          (nume[index] == 0) ? nume[index] = 1 : nume[index] = 0; 
                          print(nume);
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