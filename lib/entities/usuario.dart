class Usuario {
  String nombre = "";
  String tiempoRestante = "";

  Usuario.fromJson(Map datos)
    : nombre = datos['nombre'] ?? "",
      tiempoRestante = datos['saldohoras']?.toString() ?? "";
}
