import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fsplugin/entities/trabajo.dart';
import 'package:fsplugin/entities/usuario.dart';
import 'package:http/http.dart' as http;

class UsuarioProvider extends ChangeNotifier {
  Usuario? usuario;
  List<Trabajo>? listaTrabajos;
  bool isLoading = false;
  String? error;

  getInfo() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      await getUsuario();
      await getTrabajos();
    } catch (e) {
      error = e.toString();
      print('Error en getInfo: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  getUsuario() async {
    var url = Uri.parse(
      'http://fsplugin.local/facturascripts/api/3/clientes/12',
    );
    var res = await http.get(url, headers: {'Token': 'gtflPcs1Twk52EQmVZI4'});

    if (res.statusCode == 200) {
      final registro = json.decode(res.body);
      usuario = Usuario.fromJson(registro);
    } else {
      throw Exception('Error al obtener usuario: ${res.body}');
    }
  }

  getTrabajos() async {}
}
