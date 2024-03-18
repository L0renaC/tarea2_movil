import 'package:flutter/material.dart';
import 'package:tarea2_movil/controller/TareasController.dart';
import 'package:tarea2_movil/models/Tareas.dart';
import 'package:tarea2_movil/views/pages/AgregarTarea.dart';
import 'package:tarea2_movil/views/pages/EditarTarea.dart';
import 'package:tarea2_movil/views/widgets/TareaTitulo.dart';

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
        centerTitle: true,
        title: Text(
          'Tareas pendientes',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: tareas.length,
        itemBuilder: (context, index) {
          return TareaTile(
            tarea: tareas[index],
            onToggle: (value) {
              setState(() {
                _tareasController.marcarTareaComoCompletada(index, value);
              });
            },
            onDelete: () {
              setState(() {
                _tareasController.eliminarTarea(index);
                tareas = _tareasController.getTareas();
              });
            },
            onEdit: (editedTarea) async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditarTareaPage(tarea: editedTarea),
                ),
              );
              if (result != null) {
                _tareasController.editarTarea(index,result);
                setState(() {
                  tareas = _tareasController.getTareas();
                });
              }
            },
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
