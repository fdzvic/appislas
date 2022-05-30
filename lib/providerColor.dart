import 'package:flutter/material.dart';

class ColorContainerProvaider with ChangeNotifier {
  int _valor = 0;
  Color colorBase = Colors.blue;

  int get valor{
    return _valor;
  }

  set valor (int num){
    this._valor = num;
    this.colorBase = (num == 1) ? Colors.yellow : Colors.blue;
  
    notifyListeners();
  }

}