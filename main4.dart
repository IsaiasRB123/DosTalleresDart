import 'dart:io';

List<String> lista = ["Roles", "Acceso", "Usuarios", "Citas"];

void insertarElemento(String elemento) {
  lista.add(elemento);
  print('Elemento insertado correctamente.');
}

void modificarElemento(int indice, String nuevoElemento) {
  if (indice >= 0 && indice < lista.length) {
    lista[indice] = nuevoElemento;
    print('Elemento modificado correctamente.');
  } else {
    print('El índice proporcionado está fuera de rango.');
  }
}

void eliminarElemento(int indice) {
  if (indice >= 0 && indice < lista.length) {
    lista.removeAt(indice);
    print('Elemento eliminado correctamente.');
  } else {
    print('El índice proporcionado está fuera de rango.');
  }
}

void consultarLista() {
  if (lista.isEmpty) {
    print('La lista está vacía.');
  } else {
    print('Elementos en la lista:');
    for (int i = 0; i < lista.length; i++) {
      print('$i: ${lista[i]}');
    }
  }
}

void main() {
  bool salir = false;

  while (!salir) {
    print('\nSelecciona una opción:');
    print('1. Insertar elemento');
    print('2. Modificar elemento');
    print('3. Eliminar elemento');
    print('4. Consultar lista');
    print('5. Salir');

    String opcion = stdin.readLineSync() ?? '';
    switch (opcion) {
      case '1':
        print('Ingrese el elemento a insertar:');
        String elementoInsertar = stdin.readLineSync() ?? '';
        insertarElemento(elementoInsertar);
        break;
      case '2':
        if (lista.isNotEmpty) {
          print('Índice del elemento a modificar:');
          int indiceModificar = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
          if (indiceModificar != -1) {
            print('Ingrese el nuevo elemento:');
            String nuevoElemento = stdin.readLineSync() ?? '';
            modificarElemento(indiceModificar, nuevoElemento);
          } else {
            print('Entrada inválida para el índice.');
          }
        } else {
          print('La lista está vacía. No hay elementos para modificar.');
        }
        break;
      case '3':
        if (lista.isNotEmpty) {
          print('Índice del elemento a eliminar:');
          int indiceEliminar = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
          if (indiceEliminar != -1) {
            eliminarElemento(indiceEliminar);
          } else {
            print('Entrada inválida para el índice.');
          }
        } else {
          print('La lista está vacía. No hay elementos para eliminar.');
        }
        break;
      case '4':
        consultarLista();
        break;
      case '5':
        salir = true;
        print('Saliendo del programa...');
        break;
      default:
        print('Opción no válida. Por favor, ingresa un número del 1 al 5.');
        break;
    }
  }
}
