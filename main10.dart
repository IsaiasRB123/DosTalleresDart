import 'dart:io';

class Inmueble {
  String direccion;
  double valorArriendo;
  double valorVenta;

  Inmueble(this.direccion, this.valorArriendo, this.valorVenta) {
    if (valorArriendo < 0 || valorVenta < 0) {
      throw ArgumentError(
          "El valor de arriendo y venta no puede ser negativo.");
    }
  }

  void imprimirInmueble() {
    print("Dirección: $direccion");
    print("Valor de Arriendo: \$${valorArriendo.toStringAsFixed(2)}");
    print("Valor de Venta: \$${valorVenta.toStringAsFixed(2)}");
  }
}

class Apartamento extends Inmueble {
  int numHabitaciones;

  Apartamento(String direccion, double valorArriendo, double valorVenta,
      this.numHabitaciones)
      : super(direccion, valorArriendo, valorVenta);
}

class Casa extends Inmueble {
  int numPisos;

  Casa(String direccion, double valorArriendo, double valorVenta, this.numPisos)
      : super(direccion, valorArriendo, valorVenta);
}

void main() {
  // Solicitar entrada de datos por teclado para el Apartamento
  print("Ingrese la dirección del apartamento:");
  String direccionApartamento = stdin.readLineSync()!;
  print("Ingrese el valor de arriendo del apartamento:");
  double valorArriendoApartamento = double.parse(stdin.readLineSync()!);
  print("Ingrese el valor de venta del apartamento:");
  double valorVentaApartamento = double.parse(stdin.readLineSync()!);
  print("Ingrese el número de habitaciones del apartamento:");
  int numHabitacionesApartamento = int.parse(stdin.readLineSync()!);

  // Crear instancia de Apartamento con los datos ingresados
  var apartamento = Apartamento(direccionApartamento, valorArriendoApartamento,
      valorVentaApartamento, numHabitacionesApartamento);

  // Solicitar entrada de datos por teclado para la Casa
  print("\nIngrese la dirección de la casa:");
  String direccionCasa = stdin.readLineSync()!;
  print("Ingrese el valor de arriendo de la casa:");
  double valorArriendoCasa = double.parse(stdin.readLineSync()!);
  print("Ingrese el valor de venta de la casa:");
  double valorVentaCasa = double.parse(stdin.readLineSync()!);
  print("Ingrese el número de pisos de la casa:");
  int numPisosCasa = int.parse(stdin.readLineSync()!);

  // Crear instancia de Casa con los datos ingresados
  var casa =
      Casa(direccionCasa, valorArriendoCasa, valorVentaCasa, numPisosCasa);

  // Imprimir información de los inmuebles
  print("\nInformación del Apartamento:");
  apartamento.imprimirInmueble();
  print("\nInformación de la Casa:");
  casa.imprimirInmueble();
}
