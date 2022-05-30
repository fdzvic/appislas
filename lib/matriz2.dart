
import 'dart:io';
import 'dart:math';

main() {

  //int dimension = recibirNumero();
  List<Isla> islas = [];
  int dimension = recibirNumero();
  List<List<int>> matriz = crearMatriz(dimension);
  recorrerMatriz(dimension, matriz, islas);
  print('numero de islas: ${islas.length}');

}

int recibirNumero() {
  print('Ingrese la dimension de la matriz cuadrada');
  String? name = stdin.readLineSync();
  int numero = int.parse(name ?? "");
  return numero;
}

List<List<int>> crearMatriz (int n){

  var Lista = List.generate(n, (i) => List.generate(n, ((index) => Random().nextInt(2)), ));
  Lista.forEach( (matriz)=> print(matriz));

  return Lista;
}

List<Coordenadas> listaVecinos(int i, int j, List<List<int>> matriz ){

  List<Coordenadas> coordenadas = [];

  try {
    if( j+1 < matriz[i].length && matriz[i][j+1] == 1){
      coordenadas.add(Coordenadas(i, j+1));
    }

    if( j-1 > 0 && matriz[i][j-1] == 1){
      coordenadas.add(Coordenadas(i, j-1));
    }

    if( i+1 < matriz.length  && matriz[i+1][j] == 1){
      coordenadas.add(Coordenadas(i+1, j));
    }

    if( i-1 > 0 && matriz[i-1][j] == 1){
      coordenadas.add(Coordenadas(i-1, j));
    }
  } catch (e) {}

  return coordenadas;
}


void verificarVecinos( int i, int j, List<List<int>> matriz, List<Isla> islas ){
  
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
    
    List<Coordenadas> listaVecinosCoord = listaVecinos(i, j, matriz);
    nuevaIsla.cordenadas.addAll(listaVecinosCoord);
    
    for(int k = 0; k < listaVecinosCoord.length; k++){
      verificarVecinos( listaVecinosCoord[k].x, listaVecinosCoord[k].y, matriz, islas );
    }

  // Ya hay una isla con esa coordenada
  }else{
    List<Coordenadas> listaVecinosCoord = listaVecinos(i, j, matriz);
    for(int k = 0; k<listaVecinosCoord.length; k++){
      if(!islas[existeIsla].tieneCoordenada(listaVecinosCoord[k])){
        islas[existeIsla].cordenadas.add(listaVecinosCoord[k]);
        verificarVecinos( listaVecinosCoord[k].x, listaVecinosCoord[k].y, matriz, islas );
      }
    }
  }
  
  
}

recorrerMatriz(int n, List<List<int>> matriz, List<Isla> islas ){
  
  for(int i = 0; i < n; i++){
    
    for (int j = 0; j < n; j++){

      if( matriz[i][j] == 1 ){

        verificarVecinos( i, j, matriz, islas );

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