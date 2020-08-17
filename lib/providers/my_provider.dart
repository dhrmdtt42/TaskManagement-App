import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techpro_app/models/task_model.dart';
import 'package:toast/toast.dart';

class MyProvider extends ChangeNotifier{

  final DatabaseReference database = FirebaseDatabase.instance.reference().child("TaskModel");
  List<TaskModel> taskList = new List<TaskModel>();

  sendData(TaskModel taskModel, BuildContext context) {
    database.push().set(
    taskModel.toJson()
    );
    notifyListeners();
    Toast.show("Your Data has been saving on server", context, gravity: 1, duration: Toast.LENGTH_LONG);
    Navigator.of(context).pop();
//    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> ))
  }


 List<TaskModel> getDataFromDatabase(){

//    database.child("TaskModel").onChildAdded.forEach((element) {
//      print(element.snapshot.key+": "+element.snapshot.value.toString());
//      TaskModel taskMod = TaskModel.fromJson(element.snapshot.value['']);
//      taskList.add(taskMod);
//    });
//    database.child("TaskModel").onChildAdded.once().then((DataSnapshot dataSnapshot){
//      var data = dataSnapshot.value;
//      int len = data.length;
//      taskList.clear();
//      for(int i=0;i<len;i++){
//        TaskModel taskMod = TaskModel.fromJson(data[i]);
//        taskList.add(taskMod);
//      }
//      notifyListeners();
//    });

//   db = FirebaseDatabase.instance.reference().child("zoom_users");
   database.once().then((DataSnapshot snapshot){
     Map<dynamic, dynamic> values = snapshot.value;
     values.forEach((key,myvalues) {
//       final Map jsonMap = jsonDecode(values);
       TaskModel taskModel = TaskModel.fromJson(myvalues);
       taskList.add(taskModel);
       print(values);
     });
   });
    return taskList;
  }
}