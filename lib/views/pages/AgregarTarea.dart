import 'package:flutter/material.dart';
import 'package:tarea2_movil/controller/TareasController.dart';



class AgregarTareaPage extends StatelessWidget {
  final TareasController _tareasController = TareasController(); 

  @override
  Widget build(BuildContext context) {
    TextEditingController tituloController = TextEditingController();
    TextEditingController descripcionController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Tarea'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: tituloController,
              decoration: InputDecoration(
                labelText: 'Título de la tarea',
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: descripcionController,
              decoration: InputDecoration(
                labelText: 'Descripción de la tarea',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String titulo = tituloController.text;
                String descripcion = descripcionController.text;
                _tareasController.agregarTarea(titulo, descripcion);
                Navigator.pop(context); 
              },
              child: Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}