import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techpro_app/providers/my_provider.dart';
import 'package:techpro_app/views/add_task.dart';
import 'package:techpro_app/views/task_details.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
      providers: [
      ChangeNotifierProvider<MyProvider>.value(value: MyProvider())],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TaskDetails(),
//      AddTaskScreen(),
    );
  }
}


