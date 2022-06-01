import 'package:appislas/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MatrixView extends StatefulWidget {

  @override
  State<MatrixView> createState() => _MatrixViewState();
}

class _MatrixViewState extends State<MatrixView> {

  List<List<int>> lista = [[0]];

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
                          (dimension.datos[index] == 0) ? dimension.datos[index] = 1 : dimension.datos[index] = 0; 
                          dimension.a = 0;
                          int c = 0;
                          lista = List.generate(dimension.dimension, (i) 
                          => List.generate(dimension.dimension, (i){
                            for(int b = c; b < dimension.dimension*dimension.dimension; b++){
                              c++;
                              return dimension.datos[b];
                             }
                              return 0;
                            }
                          ));
                          print(lista);
                          dimension.recorrerMatriz(lista);
                          lista.clear();
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