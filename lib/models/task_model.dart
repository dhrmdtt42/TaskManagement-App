import 'package:techpro_app/models/user.dart';
import 'package:techpro_app/models/category.dart';
class TaskModel{
    String taskname;
    User user;
    String date;
    String startTime;
    String endTime;
    String description;
    Category categoryTitle;

TaskModel.info({this.taskname, this.user, this.date, this.startTime, this.endTime,
      this.description, this.categoryTitle});
    TaskModel();

factory TaskModel.fromJson(Map<dynamic, dynamic> taskJson){
  return TaskModel.info(
    taskname: taskJson['taskName'],
    user: User.fromJson(taskJson['user']),
    date: taskJson['date'],
    startTime: taskJson['startTime'],
    endTime: taskJson['endTime'],
    description: taskJson['description'],
    categoryTitle: Category.fromJson(taskJson['categoryTitle'])
  );
}

    Map<String, dynamic> toJson() {
      final Map<dynamic, dynamic> data = new Map<String, dynamic>();
      data['taskName'] = this.taskname;
      data['user'] = this.user.toJson();
      data['date'] = this.date;
      data['startTime'] = this.startTime;
      data['endTime'] = this.endTime;
      data['description'] = this.description;
      data['categoryTitle'] = this.categoryTitle.toJson();
      return data;
    }
}