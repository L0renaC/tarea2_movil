import 'package:flutter/material.dart';
import 'package:tarea2_movil/models/Tareas.dart';
import 'package:tarea2_movil/views/widgets/TareaDescripcion.dart';
import 'package:tarea2_movil/views/widgets/TareaIcono.dart';

class TareaTile extends StatelessWidget {
  final Tarea tarea;
  final Function(bool) onToggle; 
  final Function() onDelete;

  TareaTile({required this.tarea, required this.onToggle, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tarea.nombre,
                style: TextStyle(
                  fontWeight: tarea.completada ? FontWeight.normal : FontWeight.bold,
                  decoration: tarea.completada ? TextDecoration.lineThrough : TextDecoration.none,
                ),
              ),
              DescripcionTarea(tarea: tarea),
            ],
          ),
          IconoTarea(tarea: tarea, onToggle: onToggle), 
          IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}