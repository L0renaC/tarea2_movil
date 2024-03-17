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
      debugShowCheckedModeBanner: false, 
      home: Scaffold(
        appBar: AppBar(
          title: Text(
          "Lista de tareas",
          style: TextStyle(
            fontWeight: FontWeight.bold, 
            color: Colors.white, 
          ),
          ),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
        ),
        body: Inicio(),
      ),
    );
  }
}
