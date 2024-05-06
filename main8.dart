void main() {
  String letra = "y";

  for (int i = 0; i < 7; i++) {
    String fila = "";
    for (int j = 0; j < 7; j++) {
      fila += letra + " ";
    }
    print(fila);
  }
}
