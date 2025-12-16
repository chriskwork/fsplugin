// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fsplugin/entities/trabajo.dart';
import 'package:fsplugin/entities/usuario.dart';
import 'package:http/http.dart' as http;

class UsuarioProvider extends ChangeNotifier {
  Usuario? usuario;
  List<Trabajo> listaTrabajos = [];

  Future<void> getInfo() async {
    await getUsuario();
    // await getTrabajos();
    notifyListeners();
  }

  Future<void> getUsuario() async {
    var url = Uri.parse(
      'http://fsplugin.local/facturascripts/api/3/clientes/1',
    );
    try {
      var res = await http.get(url, headers: {'Token': 'gtflPcs1Twk52EQmVZI4'});
      if (res.statusCode == 200) {
        print('Response body: ${res.body}'); // ← 먼저 이거 확인
        final registro = json.decode(res.body);
        print('Decoded: $registro'); // ← 구조 확인
        usuario = Usuario.fromJson(registro);
        print(usuario);
      } else {
        throw Exception('error');
      }
    } catch (e) {
      print(e);
    }
  }

  // Future<void> getTrabajos() async {}
}
