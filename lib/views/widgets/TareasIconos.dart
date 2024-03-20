import 'package:flutter/material.dart';

class IconosEdicion extends StatelessWidget {
  final void Function() onEditar;
  final void Function() onEliminar;

  const IconosEdicion({
    Key? key,
    required this.onEditar,
    required this.onEliminar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.edit, color: Colors.deepPurple),
          onPressed: onEditar,
        ),
        IconButton(
          icon: Icon(Icons.delete, color: Colors.deepPurple),
          onPressed: onEliminar,
        ),
      ],
    );
  }
}