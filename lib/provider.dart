import 'package:flutter/material.dart';

class Dimension with ChangeNotifier {
  int _dimension = 1;
  
  int get dimension{
    return _dimension;
  }

  set dimension (int numero){
    this._dimension = numero;
    notifyListeners();
  }
}