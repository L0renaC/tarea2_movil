import 'package:flutter/material.dart';
import 'package:tarea2_movil/controller/TareasController.dart';
import 'package:tarea2_movil/models/Tareas.dart';
import 'package:tarea2_movil/views/pages/AgregarTarea.dart';

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  final TareasController _tareasController = TareasController();
  List<Tarea> tareas = [];

  @override
  void initState() {
    super.initState();
    tareas = _tareasController.getTareas();
  }

  @override
  Widget build(BuildContext context) {
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
                setState(() {
                  _tareasController.marcarTareaComoCompletada(index, value ?? false);
                });
              },
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  _tareasController.eliminarTarea(index);
                  tareas = _tareasController.getTareas();
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AgregarTareaPage(
                
                onTareaAdded: (newTarea) {
                  setState(() {
                    tareas.add(newTarea);
                  });
                },
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}