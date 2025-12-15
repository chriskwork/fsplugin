class Trabajo {
  String descripcion = "";
  String estado = "";
  String tiempo = "";

  Trabajo.fromJson(Map datos)
    : descripcion = datos['descripcion'],
      estado = datos['estado'],
      tiempo = datos['horas'];
}
