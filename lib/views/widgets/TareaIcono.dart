import 'package:flutter/material.dart';
import 'package:tarea2_movil/models/Tareas.dart';


class IconoTarea extends StatelessWidget {
  final Tarea tarea;
  final Function(bool) onToggle; 

  IconoTarea({required this.tarea, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.check_box,
        color: tarea.completada ? Colors.green : Colors.grey,
      ),
      onPressed: () => onToggle(!tarea.completada), 
    );
  }
}