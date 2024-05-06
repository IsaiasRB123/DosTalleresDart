import 'dart:io';

void main() {
  List<String> listaM = [];
  List<String> listaF = [];

  stdout.write("¿Cuántas personas deseas ingresar? ");
  int n = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < n; i++) {
    stdout.write("Ingrese el nombre de la persona ${i + 1}: ");
    String nombre = stdin.readLineSync()!;
    stdout.write("Ingrese el género de la persona (M/F): ");
    String genero = stdin.readLineSync()!.toUpperCase();

    if (genero == 'M') {
      listaM.add(nombre);
    } else if (genero == 'F') {
      listaF.add(nombre);
    } else {
      print("Género no válido. Por favor, ingrese M o F.");
      i--;
    }
  }

  print("\nPersonas con género masculino (M):");
  for (String nombre in listaM) {
    print(nombre);
  }

  print("\nPersonas con género femenino (F):");
  for (String nombre in listaF) {
    print(nombre);
  }
}
