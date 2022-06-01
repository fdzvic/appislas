# Tres Astronautas Challenge

El presente repositorio contiene el challenge presentado por la empresa Tres Astronautas.

Para realizar la aplicacion se utilizo la version de Flutter 3.0.1

Se utilizo la libreria Provider 6.0.3 como gestor de estados de la aplicación

## Ejecucion

Para ejecutar el código, se debe entrar a la carpeta contenedora y ejecutar
flutter run

# Respuesta a las preguntas

1. ¿Cuál de las siguientes definiciones describe mejor lo que es un algoritmo?

a. Un programa computacional ejecutado por un sistema.

b. Un conjunto de palabras claves (if's, for's switch’s) organizados de forma tal que expresen la lógica de un problema computacional para que pueda ser ejecutado por un lenguaje computacional

c. Una serie de instrucciones organizadas secuencialmente para obtener un resultado definido y predecible según condiciones de inicio.

d. Un programa computacional ejecutado de manera secuencial con un resultado definido independiente del contexto.

**Respuesta: c**


2. ¿Qué significa la complejidad de un algoritmo?

a. El tiempo que se demora en ejecutarse según el tamaño de su entrada.

b. Una representación en orden de magnitud del esfuerzo computacional, expresado en términos del tamaño de las estructuras de  datos de entrada

c. La cantidad de operaciones y/o posiciones en memoria que un algoritmo necesita para ejecutarse, expresada como un orden de magnitud del tamaño de las variables de entrada.

d. Una representación del esfuerzo lógico para implementar, ejecutar y entender un algoritmo

**Respuesta: b**

3. Cuáles de las siguientes son estructuras de datos comúnmente utilizadas?

a. Árboles, Grafos, Arreglos, Conjuntos y Listas

b. Grafos, Listas, Árboles, Funciones y Booleanos

c. Enteros, Booleanos, Strings, Arreglos y Funciones

d. Booleanos, Strings, Funciones, Listas y Conjuntos

**Respuesta: a**

## Prueba tecnica
Para la prueba tecnica la logica del ejercicio de las islas se encuentra en el archivo *algorithmLogic.dart* que se encuentra en la carpeta **lib** del proyecto.

Una vez implementado el algoritmo responda las siguientes preguntas:

**¿Cuál es la complejidad algorítmica de la solución propuesta?**

**respuesta:** n^3 log n


**¿Cuál es la estructura de datos principal que utilizó para resolver el problema?**

**Respuesta:**Se utilizaron como estructura principal las listas de datos, para crear, recorrer y redibujar la matriz.

**Si quisiéramos modificar el algoritmo para que reconozca las diagonales como parte de una misma isla, ¿en dónde deberíamos modificar el código?**

**Respuesta:** Lo que tendriamos que hacer es dirigirnos a la carpeta **lib** y abrir el archivo *algorithmLogic.dart*, ya ubicados debemos ir al metodo o funcion llamada ***listaDeVecinos*** y agregar las condiciones correspondientes para las cordenadas de los datos en diagonal. Podriamos tambien crear una lista con las coordenadas posibles de datos vecinos y correrla para ser mas dinamico el proceso.


### Muchas gracias! 

