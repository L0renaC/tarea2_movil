import 'package:flutter/material.dart';
import 'package:tarea2_movil/models/Tareas.dart';
import 'package:tarea2_movil/views/widgets/TareaDescripcion.dart';
class TareaTile extends StatelessWidget {
  final Tarea tarea;
  final void Function(bool?) onToggle;
  final void Function() onDelete;
  final void Function(Tarea) onEdit;

  TareaTile({required this.tarea, required this.onToggle, required this.onDelete, required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(11),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Checkbox(
            value: tarea.completada,
            onChanged: onToggle,
          ),
          Expanded(
            child: Container(
              constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
              child: Column(
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
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.edit, color: Colors.deepPurple),
                onPressed: () => onEdit(tarea),
              ),
              IconButton(
                icon: Icon(Icons.delete, color: Colors.deepPurple),
                onPressed: onDelete,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
