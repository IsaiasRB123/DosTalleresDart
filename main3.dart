import 'dart:ffi';
import 'dart:io';

void main() {
  bool salir = true;
  while (salir) {
    print("Digite una opcion");
    print("1.SUMA");
    print("2.RESTA");
    print("3.MULTIPLICACION");
    print("4.DIVISION");
    print("5.salir");
    int option = int.parse(stdin.readLineSync()!);
    if (option == 1) {
      print("Digite el numero 1:");
      double num1 = double.parse(stdin.readLineSync()!);
      print("Digite el numero 2:");
      double num2 = double.parse(stdin.readLineSync()!);

      print(sumar(num1, num2));
    } else if (option == 2) {
      print("Digite el numero 1:");
      double num1 = double.parse(stdin.readLineSync()!);
      print("Digite el numero 2:");
      double num2 = double.parse(stdin.readLineSync()!);
      print(restar(num1, num2));
    } else if (option == 3) {
      print("Digite el numero 1:");
      double num1 = double.parse(stdin.readLineSync()!);
      print("Digite el numero 2:");
      double num2 = double.parse(stdin.readLineSync()!);
      print(multiplicar(num1, num2));
    } else if (option == 4) {
      print("Digite el numero 1:");
      double num1 = double.parse(stdin.readLineSync()!);
      print("Digite el numero 2:");
      double num2 = double.parse(stdin.readLineSync()!);
      print(dividir(num1, num2));
    } else if (option == 5) {
      salir = false;
    }
  }
}

double sumar(double num1, double num2) {
  return num1 + num2;
}

double restar(double num1, double num2) {
  return num1 - num2;
}

double multiplicar(double num1, double num2) {
  return num1 * num2;
}

double dividir(double num1, double num2) {
  return num1 / num2;
}
