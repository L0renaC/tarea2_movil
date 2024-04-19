import 'package:tarea2_movil/models/Tareas.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TareasController {
  FirebaseFirestore db = FirebaseFirestore.instance;
  List<Tarea> tareas = [];
  final String collection = "Tarea";

  Future<void> agregarTarea(Tarea) async {
    tareas.add(Tarea);   
  }
  Future<String> addarea(Map<String,dynamic> TareaMap) async{
    DocumentReference response = await db.collection(collection).add(TareaMap);
    return response.id;
  }

  void marcarTareaComoCompletada(int index, bool? completada) {
    if (index >= 0 && index < tareas.length) {
      tareas[index].completada = completada ?? false;
    } else {
      throw Exception('Índice fuera de los límites de la lista de tareas');
    }
  }

    Future<void> editarTarea(int index, Tarea tareaEditada)async {
    if (index >= 0 && index < tareas.length) {
      tareas[index] = tareaEditada;
      //await db.collection(collection).doc(id).update(tareaEditada);
    } else {
      throw Exception('Índice fuera de los límites de la lista de tareas');
    }
  }
  void eliminarTarea(int index) {
    if (index >= 0 && index < tareas.length) {
      tareas.removeAt(index);
    } else {
      throw Exception('Índice fuera de los límites de la lista de tareas');
    }
  }
  List<Tarea>  getTareas() {
    return tareas;
  }
  int getTareasCompletadas() {
    return tareas.where((tarea) => tarea.completada).length;
  }
}