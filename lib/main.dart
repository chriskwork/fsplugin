import 'package:flutter/material.dart';
import 'package:fsplugin/main_screen.dart';
import 'package:fsplugin/usuario_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UsuarioProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.amber)),
        home: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Nombre de Usuario'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Contraseña'),
                ),

                SizedBox(height: 20),

                FilledButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainScreen()),
                    );
                  },
                  child: Text("Enterar"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
