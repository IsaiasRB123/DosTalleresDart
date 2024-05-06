import 'dart:math';

class Circulo {
  double _radio;

  Circulo(double radio)
      : _radio = (radio >= 0)
            ? radio
            : throw ArgumentError('El radio no puede ser negativo');

  double calcularArea() {
    return pi * pow(_radio, 2);
  }

  double calcularPerimetro() {
    return 2 * pi * _radio;
  }

  double get radio => _radio;

  set radio(double nuevoRadio) {
    if (nuevoRadio >= 0) {
      _radio = nuevoRadio;
    } else {
      throw ArgumentError('El radio no puede ser negativo');
    }
  }
}

void main() {
  Circulo miCirculo = Circulo(5.0);

  print('Área del círculo: ${miCirculo.calcularArea()}');

  print('Perímetro del círculo: ${miCirculo.calcularPerimetro()}');

  try {
    miCirculo.radio = -3.0;
  } catch (e) {
    print('Error: ${e.toString()}');
  }
}
