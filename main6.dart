class Usuario {
  String? nombre;
  int? edad;

  void registrarDatos() {
    print("Registrando datos...");
    print("Nombre: $nombre");
    print("Edad: $edad");
    print("Datos registrados exitosamente.");
  }
}

void main() {
  var usuario = Usuario();

  usuario.nombre = "Juan";
  usuario.edad = 30;

  usuario.registrarDatos();
}
