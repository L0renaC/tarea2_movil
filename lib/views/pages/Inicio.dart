import 'package:flutter/material.dart';
import 'package:tarea2_movil/controller/TareasController.dart';

import 'package:tarea2_movil/models/tareas.dart'; 

class Inicio extends StatelessWidget {
  final TareasController _tareasController = TareasController(); 

  @override
  Widget build(BuildContext context) {
    List<Tarea> tareas = _tareasController.getTareas(); 

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tareas'),
      ),
      body: ListView.builder(
        itemCount: tareas.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tareas[index].nombre),
            subtitle: Text(tareas[index].descripcion),
            leading: Checkbox(
              value: tareas[index].completada,
              onChanged: (value) {
                _tareasController.marcarTareaComoCompletada(index, value ?? false);
              },
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                _tareasController.eliminarTarea(index);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        child: Icon(Icons.add),
      ),
    );
  }
}