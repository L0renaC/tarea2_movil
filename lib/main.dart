import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tarea2_movil/firebase_options.dart';
import 'package:tarea2_movil/views/pages/inicio.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(MainApp());
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
