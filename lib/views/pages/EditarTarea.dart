
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
                labelText: "Nombre de la tarea",
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: descripcionController,
              decoration: InputDecoration(
                labelText: "Descripción de la tarea",
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String nuevoNombre = nombreController.text;
                String nuevaDescripcion = descripcionController.text;
                if(!nuevoNombre.isEmpty && !nuevaDescripcion.isEmpty){
                  Tarea tareaEditada = Tarea(
                  nombre: nuevoNombre,
                  descripcion: nuevaDescripcion,
                  completada: widget.tarea.completada, 
                );
                Navigator.pop(context, tareaEditada);
                }else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
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
                    ),
                  );
                }  
              },
              child: Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}