import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_list_flutter/models/task_model.dart';

CollectionReference<Task> getTaskCollectionReference(){
  var ref = FirebaseFirestore.instance.collection('tasks')
      .withConverter(fromFirestore: (snapshot, options) => Task.fromJson(snapshot.data()!) , toFirestore: (value, options) => value.toJson(),);
  return ref;
}
Future<void> addTaskToFireStore(Task task){
 var collection = getTaskCollectionReference();
 var docRef = collection.doc();
 task.id = docRef.id;
 return docRef.set(task);
}
Future<QuerySnapshot<Task>> getTasks(int date){
  var collection = getTaskCollectionReference();
  
  return collection
  .where('date_in_milliSecond', isEqualTo: date)
  .get();
}