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
    List<Tarea> tareasPendientes = [];
    List<Tarea> tareasCompletadas = [];

    for (Tarea tarea in tareas) {
      if (tarea.completada) {
        tareasCompletadas.add(tarea);
      } else {
        tareasPendientes.add(tarea);
      }
    }
    List<Tarea> tareasOrdenadas = [];
    tareasOrdenadas.addAll(tareasPendientes);
    tareasOrdenadas.addAll(tareasCompletadas);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Tus tareas",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: tareasOrdenadas.length,
        itemBuilder: (context, index) {
          return TareaTile(
            tarea: tareasOrdenadas[index],
            onToggle: (value) {
              setState(() {
                int tareaIndex = tareas.indexOf(tareasOrdenadas[index]);
                _tareasController.marcarTareaComoCompletada(tareaIndex, value);
                tareas = _tareasController.getTareas();
              });
            },
            onDelete: () {
              setState(() {
                int tareaIndex = tareas.indexOf(tareasOrdenadas[index]);
                _tareasController.eliminarTarea(tareaIndex);
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
                int tareaIndex = tareas.indexOf(tareasOrdenadas[index]);
                _tareasController.editarTarea(tareaIndex, result);
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