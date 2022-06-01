import 'package:appislas/algorithmLogic.dart';
import 'package:flutter/material.dart';

class Dimension with ChangeNotifier {
  int _dimension = 1;
  int islas = 0;
  List<int> datos = [0];
  List<List<int>> matrix = [];
  AlgorithmLogic algorithm = AlgorithmLogic();
  int a = 0;
  
  int get dimension{
    return _dimension;
  }

  set dimension (int numero){
    _dimension = numero;
    notifyListeners();
  }

  crearMatriz(){
    matrix.clear();
    islas = 0;
    algorithm.islas.clear();
    matrix = algorithm.crearMatriz(_dimension);
    recorrerMatriz(matrix);
    
  }
  recorrerMatriz(List<List<int>> matrixxz){
    islas = 0;
    algorithm.recorrerMatriz(_dimension, matrixxz, algorithm.islas);
    islas = algorithm.islas.length;
    print('las islas $islas');
    notifyListeners();
  }
  
  llenarLista(){
    datos.clear();
    for (int i = 0; i < _dimension; i++) {
      for (int j = 0; j < _dimension; j++) {
        datos.add(matrix[i][j]);
      } 
    }
   
  }  
  
  colorElegido(){
      for (int i = a; i < _dimension*_dimension; i++) {
        int valor = datos[i];
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

  

}

