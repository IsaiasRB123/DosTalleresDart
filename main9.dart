import 'dart:io';
import 'dart:math';

class Venta {
  String codigo;
  String nombre;
  double precio;
  int cantidad;

  Venta(this.codigo, this.nombre, this.precio, this.cantidad);

  double calcularValorPagar() {
    if (precio <= 0 || cantidad <= 0) {
      throw ArgumentError("El precio y la cantidad deben ser mayores que 0.");
    }

    double valorBruto = precio * cantidad;

    if (cantidad > 10) {
      valorBruto *= 0.9; // Aplicar descuento del 10% si la cantidad es > 10
    }

    double valorIVA = valorBruto * 0.19; // Calcular el valor del IVA (19%)

    return valorBruto + valorIVA;
  }
}

List<String> documentos = [];
List<String> nombres = [];
List<int> inasistencias = [];

void main() {
  while (true) {
    print("--------------------MENÚ---------------------");
    print("1. Registrar inasistencias");
    print("2. Listar todas las inasistencias");
    print("3. Listar los aprendices con inasistencias superiores a 3");
    print("4. Consultar el total de inasistencias por aprendiz");
    print("5. Valor a pagar");
    print("6. Número de suerte");
    print("7. Salir");
    print("----------------Digite la opción---------------");

    int opcion = int.parse(stdin.readLineSync()!);

    switch (opcion) {
      case 1:
        registrarInasistencias();
        break;
      case 2:
        listarTodasInasistencias();
        break;
      case 3:
        listarInasistenciasMayores();
        break;
      case 4:
        consultarTotalInasistencias();
        break;
      case 5:
        calcularValorPagar();
        break;
      case 6:
        generarNumeroSuerte();
        break;
      case 7:
        exit(0);
        break;
      default:
        print("Opción no válida. Por favor, seleccione otra opción.");
    }
  }
}

void registrarInasistencias() {
  print("Digite el documento del aprendiz:");
  String documento = stdin.readLineSync()!;

  if (documentos.contains(documento)) {
    print("Digite la cantidad de inasistencias:");
    int inasistencia = int.parse(stdin.readLineSync()!);
    if (inasistencia < 1 || inasistencia > 100) {
      print("La cantidad de inasistencias debe estar entre 1 y 100.");
      return;
    }
    int index = documentos.indexOf(documento);
    inasistencias[index] = inasistencia;
    print("Inasistencias actualizadas.");
  } else {
    print("Digite el nombre completo del aprendiz:");
    String nombre = stdin.readLineSync()!;
    print("Digite la cantidad de inasistencias:");
    int inasistencia = int.parse(stdin.readLineSync()!);
    if (inasistencia < 1 || inasistencia > 100) {
      print("La cantidad de inasistencias debe estar entre 1 y 100.");
      return;
    }
    documentos.add(documento);
    nombres.add(nombre);
    inasistencias.add(inasistencia);
    print("Inasistencias registradas.");
  }
}

void listarTodasInasistencias() {
  print("-----------Lista de todas las inasistencias------------");
  for (int i = 0; i < documentos.length; i++) {
    print("Estudiante Registrado #${i + 1}:");
    print("Documento: ${documentos[i]}");
    print("Nombre: ${nombres[i]}");
    print("Inasistencias: ${inasistencias[i]}\n");
  }
}

void listarInasistenciasMayores() {
  print("--------Lista de inasistencias mayores a 3---------");
  for (int i = 0; i < documentos.length; i++) {
    if (inasistencias[i] > 3) {
      print("Documento: ${documentos[i]}");
      print("Nombre: ${nombres[i]}");
      print("Inasistencias: ${inasistencias[i]}\n");
    }
  }
}

void consultarTotalInasistencias() {
  print("Digite el documento del aprendiz:");
  String documento = stdin.readLineSync()!;
  if (documentos.contains(documento)) {
    int index = documentos.indexOf(documento);
    print(
        "Total de inasistencias para el aprendiz ${nombres[index]}: ${inasistencias[index]}");
  } else {
    print("El documento no está registrado.");
  }
}

void calcularValorPagar() {
  print("Ingrese el código del producto:");
  String codigo = stdin.readLineSync()!;
  print("Ingrese el nombre del producto:");
  String nombre = stdin.readLineSync()!;
  print("Ingrese el precio del producto:");
  double precio = double.parse(stdin.readLineSync()!);
  print("Ingrese la cantidad del producto:");
  int cantidad = int.parse(stdin.readLineSync()!);

  try {
    Venta venta = Venta(codigo, nombre, precio, cantidad);
    double valorPagar = venta.calcularValorPagar();
    print("El valor a pagar es: \$${valorPagar.toStringAsFixed(2)}");
  } catch (e) {
    print("Error: ${e.toString()}");
  }
}

void generarNumeroSuerte() {
  Random random = Random();
  int numeroSuerte = random.nextInt(1000);
  String numeroSuerteStr = numeroSuerte.toString().padLeft(3, '0');
  print("Tu número de la suerte es: $numeroSuerteStr");
}
