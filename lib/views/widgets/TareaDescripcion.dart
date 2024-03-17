import 'package:flutter/material.dart';
import 'package:tarea2_movil/models/Tareas.dart';
class DescripcionTarea extends StatelessWidget {
  final Tarea tarea;

  DescripcionTarea({required this.tarea});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tarea.descripcion,
          style: const TextStyle(fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}