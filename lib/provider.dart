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
    islas = 0;
    matrix.clear();
    algorithm.islas.clear();
    matrix = algorithm.crearMatriz(_dimension);
    algorithm.recorrerMatriz(_dimension, matrix, algorithm.islas);
    islas = algorithm.islas.length;
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

