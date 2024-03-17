import 'package:flutter/material.dart';
import 'package:tarea2_movil/views/pages/inicio.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title:  Text("tareas"),
          backgroundColor: Colors.blueAccent,
        ),
        body: Inicio(),
      ),
    );
  }
}
