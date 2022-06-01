import 'dart:math';


class AlgorithmLogic {

  List<Isla> islas = [];
  List<List<int>> matrix = [];

  List<List<int>> crearMatriz (int n){
  matrix.clear();
  matrix = List.generate(n, (i) => List.generate(n, ((index) => Random().nextInt(2)), ));
  matrix.forEach( (matriz)=> print(matriz));
  islas.clear();
  return matrix;
}

  List<Coordenadas> listaVecinos(int i, int j, List<List<int>> matrix ){

    List<Coordenadas> coordenadas = [];

    try {
      if( j+1 < matrix[i].length && matrix[i][j+1] == 1){
        coordenadas.add(Coordenadas(i, j+1));
      }

      if( j-1 > 0 && matrix[i][j-1] == 1){
        coordenadas.add(Coordenadas(i, j-1));
      }

      if( i+1 < matrix.length  && matrix[i+1][j] == 1){
        coordenadas.add(Coordenadas(i+1, j));
      }

      if( i-1 > 0 && matrix[i-1][j] == 1){
        coordenadas.add(Coordenadas(i-1, j));
      }
    } catch (e) {}

    return coordenadas;
  }

  void verificarVecinos( int i, int j, List<List<int>> matrix, List<Isla> islas ){

    int existeIsla = -1;

    for(int a = 0; a < islas.length ; a++){
      if(islas[a].tieneCoordenada(Coordenadas(i, j))){
        existeIsla = a; 
        break;             
      }
    }

    // No hay islas con esa coordenada
    if (existeIsla == -1) {

      Isla nuevaIsla = Isla();
      nuevaIsla.cordenadas.add(Coordenadas(i,j));
      islas.add(nuevaIsla);

      List<Coordenadas> listaVecinosCoord = listaVecinos(i, j, matrix);
      nuevaIsla.cordenadas.addAll(listaVecinosCoord);

      for(int k = 0; k < listaVecinosCoord.length; k++){
        verificarVecinos( listaVecinosCoord[k].x, listaVecinosCoord[k].y, matrix, islas );
      }

    // Ya hay una isla con esa coordenada
    }else{
      List<Coordenadas> listaVecinosCoord = listaVecinos(i, j, matrix);
      for(int k = 0; k<listaVecinosCoord.length; k++){
        if(!islas[existeIsla].tieneCoordenada(listaVecinosCoord[k])){
          islas[existeIsla].cordenadas.add(listaVecinosCoord[k]);
          verificarVecinos( listaVecinosCoord[k].x, listaVecinosCoord[k].y, matrix, islas );
        }
      }
    }

  }

  recorrerMatriz(int n, List<List<int>> matrix, List<Isla> islas ){
    islas.clear();
    
    for(int i = 0; i < n; i++){

      for (int j = 0; j < n; j++){

        if( matrix[i][j] == 1 ){

          verificarVecinos( i, j, matrix, islas );

        }

      }
    }
  }
}

class Isla {

  List<Coordenadas> cordenadas = [];

  tieneCoordenada(Coordenadas coordenadaNueva){

    for (var i = 0; i < cordenadas.length; i++) {
      if (coordenadaNueva.compararCoordenada(cordenadas[i])){
        return true;
      }
    }
    return false;
  }
}

class Coordenadas {

  int x;
  int y;
  
  Coordenadas(this.x, this.y);

  compararCoordenada(Coordenadas coordenada ){
    if (x == coordenada.x && y == coordenada.y) {
      return true;
    } else{
      return false;
    }
  }
}