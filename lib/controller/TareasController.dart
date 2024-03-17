import 'package:tarea2_movil/models/tareas.dart';

class TareasController {
  List<Tarea> tareas = [];

  void agregarTarea(String nombre, String descripcion) {
    tareas.add(Tarea(nombre: nombre, descripcion: descripcion));
  }

  void marcarTareaComoCompletada(int index, bool completada) {
    if (index >= 0 && index < tareas.length) {
      tareas[index].completada = completada;
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

  int getTotalTareas() {
    return tareas.length;
  }

  List<Tarea> getTareas() {
    return tareas;
  }

  int getTareasCompletadas() {
    return tareas.where((tarea) => tarea.completada).length;
  }
}


