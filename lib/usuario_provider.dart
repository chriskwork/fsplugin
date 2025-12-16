// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fsplugin/config/api_config.dart';
// import 'package:fsplugin/entities/trabajo.dart';
import 'package:fsplugin/entities/usuario.dart';
import 'package:http/http.dart' as http;

class UsuarioProvider extends ChangeNotifier {
  Usuario? _usuario;
  // List<Trabajo> listaTrabajos = [];

  Usuario? get usuario => _usuario;
  bool isLogin = false;

  Future<void> getInfo() async {
    await getUsuario();
    // await getTrabajos();
    notifyListeners();
  }

  Future<void> getUsuario() async {
    var url = Uri.parse('http://fsplugin.local/facturascripts/api/3');
    try {
      var res = await http.get(url, headers: {'Token': 'gtflPcs1Twk52EQmVZI4'});
      if (res.statusCode == 200) {
        final registro = json.decode(res.body);
        _usuario = Usuario.fromJson(registro);
      } else {
        throw Exception('error');
      }
    } catch (e) {
      print(e);
    }
  }

  // Future<void> getTrabajos() async {}

  Future<bool> login(String username, String password) async {
    final url = Uri.parse('${ApiConfig.baseUrl}/api/3/login');

    try {
      final response = await http.post(
        url,
        headers: {
          'Token': ApiConfig.apiToken,
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {'nick': username, 'password': password},
      );

      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        _usuario = Usuario.fromJson(result['data']);
        notifyListeners();
        return true;
      }
    } catch (e) {
      print('Error: $e');
    }
    return false;
  }
}
