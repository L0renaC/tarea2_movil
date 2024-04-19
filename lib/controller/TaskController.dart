import 'package:cloud_firestore/cloud_firestore.dart';

class TaskController {
  FirebaseFirestore db = FirebaseFirestore.instance;

  final String collection = "Tarea";

  Future<String> create(Map<String, dynamic> Tarea) async {
    DocumentReference response = await db.collection(collection).add(Tarea);
    return response.id;
  }

  Future<void> createWithId(Map<String,dynamic> Tarea, String id) async {
    await db.collection(collection).doc(id).set(Tarea);
  }
}