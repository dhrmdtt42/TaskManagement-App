import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:techpro_app/models/category.dart';
import 'package:techpro_app/models/task_model.dart';
import 'package:techpro_app/models/user.dart';
import 'package:techpro_app/providers/my_provider.dart';
import 'package:techpro_app/utils/constants.dart';
import 'package:techpro_app/utils/piechartcustompainter.dart';
import 'package:techpro_app/utils/strings.dart';
class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {

  bool isSelectedUser1 = false;
  bool isSelectedUser2 = false;
  bool isSelectedUser3 = false;
  bool isSelectedUser4 = false;
  bool isSelectedUrgent = false;
  bool isSelectedRunning = false;
  bool isSelectedOngoing = false;
  User user = new User();
  Category myCategory = new Category();

  TextEditingController taskNameController = new TextEditingController();
  TextEditingController dateTextController = new TextEditingController();
  TextEditingController startTimeController = new TextEditingController();
  TextEditingController endTimeController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();

  Color _colorFromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

  DateTime selectedDate = new DateTime.now();
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1901, 1),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        dateTextController.value = TextEditingValue(text: picked.toString().substring(0,10));
      });
  }

  TimeOfDay selectedTime = new TimeOfDay.now();
  Future<Null> _selectTimeStamp(BuildContext context) async {
    final TimeOfDay timePicked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (timePicked != null && timePicked != selectedTime) {
      setState(() {
        selectedTime = timePicked;
        startTimeController.value = TextEditingValue(text: timePicked.toString().substring(10,15));
      });

    }
  }

  TimeOfDay selectedEndTime = new TimeOfDay.now();
  Future<Null> _selectEndTimeStamp(BuildContext context) async {
    final TimeOfDay endTimePicked = await showTimePicker(
      context: context,
      initialTime: selectedEndTime,
    );
    if (endTimePicked != null && endTimePicked != selectedEndTime) {
      setState(() {
        selectedEndTime = endTimePicked;
        endTimeController.value = TextEditingValue(text: endTimePicked.toString().substring(10,15));
      });

    }
  }

    @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.topLeft,
      child: CustomPaint(
        foregroundPainter: PieChartCustomPainter(
          width: MediaQuery.of(context).size.width * 1.0,
          categories: category
        ),
        child: Scaffold(
          backgroundColor: _colorFromHex("#6863f4"),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.white,),),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(Icons.perm_contact_calendar, color: Colors.white,),
              ),
            ],
          ),
          body: Column(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 20,),
                  Align(
                    alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top:16.0, left: 16.0, right: 16.0,),
                        child: Text("Add Task",
                          style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),
                      )),
//              Text("current time", style: TextStyle(color: Colors.white, fontSize: 16,),),
                  SizedBox(height: 60,)

                ],
              ), //to show the clock
              Expanded(
                child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(60)),
                        color: Colors.white),
                    child: ListView(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: TextField(
                            controller: taskNameController,
                            style: TextStyle(
                            ),
                            decoration: InputDecoration(
                              hintText: "Your Task Name",
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.grey),

                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("RECENT MEET",
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey
                            ),),
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              InkWell(
                                onTap:(){
                                  setState(() {
                                    isSelectedUser1 = true;
                                    isSelectedUser4 = false;
                                    isSelectedUser2 = false;
                                    isSelectedUser3 = false;
                                    user.userName = "James Mangold";
                                    user.userId = "101";
                                  });
                               },
                                child: Container(
                          margin: EdgeInsets.only(right: kDefaultPadding),
                          width: 80,
                          child: Column(
                            children: <Widget>[
                                Container(
                                  height: 70,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                     colorFilter: ColorFilter.linearToSrgbGamma(),
                                      image: isSelectedUser1== false? AssetImage(
                                        "assets/actor1.png"
                                      ) : AssetImage(
                                          "assets/checkamrk.png"
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: kDefaultPadding / 2),
                                Text(
                                  "James Mangold",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyText2,
                                  maxLines: 2,
                                ),
                                SizedBox(height: kDefaultPadding / 4),

                            ],
                          ),
                        ),
                              ),
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    isSelectedUser2 = true;
                                    isSelectedUser4 = false;
                                    isSelectedUser1 = false;
                                    isSelectedUser3 = false;
                                    user.userName  = "Matt Damon";
                                    user.userId = "102";
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: kDefaultPadding),
                                  width: 80,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        height: 70,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image:  isSelectedUser2== false? AssetImage(
                                                "assets/actor2.png"
                                            ) : AssetImage(
                                                "assets/checkamrk.png"
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: kDefaultPadding / 2),
                                      Text(
                                        "Matt Damon",
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context).textTheme.bodyText2,
                                        maxLines: 2,
                                      ),
                                      SizedBox(height: kDefaultPadding / 4),

                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    isSelectedUser3 = true;
                                    isSelectedUser4 = false;
                                    isSelectedUser1 = false;
                                    isSelectedUser2 = false;
                                    user.userName = "Christian Bale";
                                    user.userId = "103";
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: kDefaultPadding),
                                  width: 80,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        height: 70,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: isSelectedUser3== false? AssetImage(
                                                "assets/actor3.png"
                                            ) : AssetImage(
                                                "assets/checkamrk.png"
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: kDefaultPadding / 2),
                                      Text(
                                        "Christian Bale",
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context).textTheme.bodyText2,
                                        maxLines: 2,
                                      ),
                                      SizedBox(height: kDefaultPadding / 4),

                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    isSelectedUser4 = true;
                                    isSelectedUser1 = false;
                                    isSelectedUser3 = false;
                                    isSelectedUser2 = false;
                                    user.userName = "Caitriona Balfe";
                                    user.userId = "104";
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: kDefaultPadding),
                                  width: 80,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        height: 70,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: isSelectedUser4== false? AssetImage(
                                                "assets/actor4.png"
                                            ) : AssetImage(
                                                "assets/checkamrk.png"
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: kDefaultPadding / 2),
                                      Text(
                                        "Caitriona Balfe",
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context).textTheme.bodyText2,
                                        maxLines: 2,
                                      ),
                                      SizedBox(height: kDefaultPadding / 4),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TextField(
                            controller: dateTextController,
                            keyboardType: TextInputType.datetime,
                            onTap: (){
                              _selectDate(context);
                            },
                            style: TextStyle(
                            ),
                            decoration: InputDecoration(
                              labelText: "DATE",
                              suffixIcon: IconButton(icon: Icon(Icons.date_range), onPressed: (){
//                            _selectDate(context);
                              }),
                              labelStyle: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold, color: Colors.grey),

                            ),
                          ),
                        ),
                         Row(
                           children: <Widget>[
                             Expanded(
                               child: Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Container(
                                   width: MediaQuery.of(context).size.width * 0.5,
                                   child: Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: TextField(
                                       onTap: (){
                                         _selectTimeStamp(context);
                                       },
                                       controller: startTimeController,
                                        style: TextStyle(
                                        ),
                                        decoration: InputDecoration(
                                          labelText: "start time",
                                          suffixIcon: IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: null),
                                          labelStyle: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold, color: Colors.grey),
                                        ),
                                      ),
                                   ),
                                 ),
                               ),
                             ),
                             Expanded(
                               child: Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Container(
                                   width: MediaQuery.of(context).size.width * 0.5,
                                   child: Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: TextField(
                                       onTap: (){
                                         _selectEndTimeStamp(context);
                                       },
                                       controller: endTimeController,
                                       style: TextStyle(
                                       ),
                                       decoration: InputDecoration(
                                         labelText: "end time",
                                         suffixIcon: IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: null),
                                         labelStyle: TextStyle(
                                             fontSize: 16.0,
                                             fontWeight: FontWeight.bold, color: Colors.grey),
                                       ),
                                     ),
                                   ),
                                 ),
                               ),
                             ),
                           ],
                         ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TextField(
                            controller: descriptionController,
                            style: TextStyle(
                            ),
                            decoration: InputDecoration(
                              labelText: "DESCRIPTION",
                              labelStyle: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold, color: Colors.grey),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:8.0, left: 12.0, bottom: 12.0),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text("CATEGORY",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold
                              ),),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: FilterChip(
                                label: Text('URGENT'),
                                labelStyle: TextStyle(
                                    color: isSelectedUrgent ? Colors.white : Colors.black),
                                selected: isSelectedUrgent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                onSelected: (bool selected) {
                                  setState(() {
                                    isSelectedUrgent = !isSelectedUrgent;
                                    isSelectedRunning = false;
                                    isSelectedOngoing = false;
                                    myCategory.categoryTitle = "URGENT";
                                    myCategory.categoryId = "11";
                                  });
                                },
                                selectedColor: Theme.of(context).accentColor,
                                checkmarkColor: Colors.white,
                              ),
                            ),
                            Expanded(
                              child: FilterChip(
                                label: Text('RUNNING'),
                                labelStyle: TextStyle(
                                    color: isSelectedRunning ? Colors.white : Colors.black),
                                selected: isSelectedRunning,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                onSelected: (bool selected) {
                                  setState(() {
                                    isSelectedRunning = !isSelectedRunning;
                                    isSelectedUrgent = false;
                                    isSelectedOngoing = false;
                                    myCategory.categoryTitle  = "RUNNING";
                                    myCategory.categoryId = "12";

                                  });
                                },
                                backgroundColor: _colorFromHex("#f689b8"),
                                selectedColor: _colorFromHex("#7be049"),
                                checkmarkColor: Colors.white,
                              ),
                            ),
                            Expanded(
                              child: FilterChip(
                                label: Text('ONGOING'),
                                labelStyle: TextStyle(
                                    color: isSelectedOngoing ? Colors.white : Colors.black),
                                selected: isSelectedOngoing,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                onSelected: (bool selected) {
                                  setState(() {
                                    isSelectedOngoing = !isSelectedOngoing;
                                    isSelectedUrgent = false;
                                    isSelectedRunning = false;
                                    myCategory.categoryTitle = "ONGOING";
                                    myCategory.categoryId = "13";
                                  });
                                },
                                backgroundColor: _colorFromHex("#e0ffff"),
                                selectedColor: _colorFromHex("#7be049"),
                                checkmarkColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 32.0, left: 24.0, right: 24.0, bottom: 32.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.85,
                              height: 50.0,
                              child: RaisedButton(onPressed: () {

                                TaskModel task = new TaskModel();

                                task.taskname = taskNameController.text;
                                task.user = user;
                                task.date = dateTextController.text;
                                task.startTime = startTimeController.text;
                                task.endTime = endTimeController.text;
                                task.description = descriptionController.text;
                                task.categoryTitle = myCategory;
                                Provider.of<MyProvider>(context, listen: false).sendData(task, context);


                              },
                                child: Text('Create New Task', style: TextStyle(color: Colors.white ),),
                                color: _colorFromHex("#0061bf"),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                    side: BorderSide(color:_colorFromHex("#0061bf"))
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
