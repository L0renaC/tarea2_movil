import 'package:flutter/material.dart';
import 'package:tarea2_movil/controller/TareasController.dart';
import 'package:tarea2_movil/models/Tareas.dart';

class AgregarTareaPage extends StatelessWidget {
  final TareasController _tareasController = TareasController();
  final Function(Tarea) onTareaAdded;

  AgregarTareaPage({required this.onTareaAdded});

  @override
  Widget build(BuildContext context) {
    TextEditingController tituloController = TextEditingController();
    TextEditingController descripcionController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Agregar Tarea",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: tituloController,
              decoration: InputDecoration(
                labelText: "Título de la tarea",
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: descripcionController,
              decoration: InputDecoration(
                labelText: "Descripción de la tarea",
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String titulo = tituloController.text;
                String descripcion = descripcionController.text;
                Tarea nuevaTarea = Tarea(
                  nombre: titulo,
                  descripcion: descripcion,
                  completada: false,
                );
                _tareasController.agregarTarea(nuevaTarea);
                onTareaAdded(nuevaTarea);
                Navigator.pop(context);
              },
              child: Text("Guardar"),
            ),
          ],
        ),
      ),
    );
  }
}