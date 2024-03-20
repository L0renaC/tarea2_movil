import 'package:flutter/material.dart';

SnackBar mostrarSnackBar(BuildContext context) {
  return SnackBar(
    content: Row(
      children: [
        Icon(
          Icons.warning,
          color: Colors.white,
        ),
        SizedBox(width: 10),
        Text(
          "Llene todos los campos.",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
    backgroundColor: const Color.fromARGB(255, 255, 47, 33),
  );
}