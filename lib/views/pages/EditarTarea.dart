import 'package:flutter/material.dart';
import 'package:tarea2_movil/models/Tareas.dart';

class EditarTareaPage extends StatefulWidget {
  final Tarea tarea;

  EditarTareaPage({required this.tarea});

  @override
  _EditarTareaPageState createState() => _EditarTareaPageState();
}

class _EditarTareaPageState extends State<EditarTareaPage> {
  TextEditingController nombreController = TextEditingController();
  TextEditingController descripcionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nombreController.text = widget.tarea.nombre;
    descripcionController.text = widget.tarea.descripcion;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar tarea",
        style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: nombreController,
              decoration: InputDecoration(
                labelText: 'Nombre de la tarea',
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: descripcionController,
              decoration: InputDecoration(
                labelText: 'Descripción de la tarea',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String nuevoNombre = nombreController.text;
                String nuevaDescripcion = descripcionController.text;
                Tarea tareaEditada = Tarea(
                  nombre: nuevoNombre,
                  descripcion: nuevaDescripcion,
                  completada: widget.tarea.completada, 
                );
                Navigator.pop(context, tareaEditada);
              },
              child: Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}