import 'package:tarea2_movil/models/Tareas.dart';

class TareasController {
  List<Tarea> tareas = [];

  void agregarTarea(Tarea) {
    tareas.add(Tarea);
  }

  void marcarTareaComoCompletada(int index, bool? completada) {
    if (index >= 0 && index < tareas.length) {
      tareas[index].completada = completada ?? false;
    } else {
      throw Exception('Índice fuera de los límites de la lista de tareas');
    }
  }

    void editarTarea(int index, Tarea tareaEditada) {
    if (index >= 0 && index < tareas.length) {
      tareas[index] = tareaEditada;
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
