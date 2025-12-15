import 'package:flutter/material.dart';
import 'package:fsplugin/entities/usuario.dart';
import 'package:fsplugin/usuario_provider.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    context.read<UsuarioProvider>().getInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Usuario? usuario = context.watch<UsuarioProvider>().usuario;
    print('nombre: ${usuario?.nombre}');

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(usuario?.nombre ?? 'Cargando...'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 32),
          const Center(
            child: Text(
              "Tiempo",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          const Center(child: Text("5:00", style: TextStyle(fontSize: 80))),
          const SizedBox(height: 20),
          Center(
            child: FilledButton(onPressed: () {}, child: const Text("Comprar")),
          ),
          const SizedBox(height: 20),
          Divider(color: Colors.grey[400]),
          const SizedBox(height: 20),
          const Text(
            "Trabajos",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),

          // 직접 위젯들 나열
          ...List.generate(
            4,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.amber[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const ListTile(
                  title: Text("description"),
                  subtitle: Text("Estado"),
                  trailing: Text("00:45"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
