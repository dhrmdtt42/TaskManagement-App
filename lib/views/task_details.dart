import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:techpro_app/models/task_model.dart';
import 'package:techpro_app/providers/my_provider.dart';
import 'package:techpro_app/views/add_task.dart';
class TaskDetails extends StatefulWidget {
  @override
  _TaskDetailsState createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {

  Color _colorFromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

  CalendarController _controller = new CalendarController();
  Map<DateTime, List<TaskModel>> _events;
  List<dynamic> _selectedEvents;
  static DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
  String string = dateFormat.format(DateTime.now());
  var now = Jiffy().format("yyyy-MM-dd HH:mm:ss");
  var a = Jiffy().yMMMMd;
  List<TaskModel> _myTaskList = new List<TaskModel>();



  @override
  Widget build(BuildContext context) {
    _myTaskList = Provider.of<MyProvider>(context,listen: false).getDataFromDatabase();
    print(_myTaskList);

   return Scaffold(
     backgroundColor: _colorFromHex("#d2f8d2"),
     appBar: AppBar(
       backgroundColor: Colors.transparent,
       elevation: 0,
       leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: _colorFromHex("#040419"),),),
       actions: <Widget>[
         Padding(
           padding: const EdgeInsets.all(16.0),
           child: Icon(Icons.perm_contact_calendar, color: Colors.white,),
         ),
       ],
     ),
     body: SingleChildScrollView(
       child: Column(
         children: <Widget>[
       Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
           SizedBox(height: 20,),
           Padding(
             padding: const EdgeInsets.only(top:16.0, left: 16.0, right: 16.0,),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: <Widget>[
                 Text("$a\nToday",
                   maxLines: 2,
                   style: TextStyle(color: _colorFromHex("#040419"), fontSize: 20, fontWeight: FontWeight.bold),),
                 SizedBox(
                   width: 120.0,
                   height: 50.0,
                   child: RaisedButton(onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> AddTaskScreen()));
                   },
                     child: Text('+  Add Task', style: TextStyle(
                       color: Colors.white,
                       fontSize: 15.0,
                       fontWeight: FontWeight.bold
                     ),
                     ),
                     color: _colorFromHex("#ff2500"),
                     shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(10.0),
                         side: BorderSide(color:_colorFromHex("#ff2500"))
                     ),
                   ),
                 ),
               ],
             ),
           ),
//              Text("current time", style: TextStyle(color: Colors.white, fontSize: 16,),),
           SizedBox(height: 60,)

         ],
       ),
           TableCalendar(
             calendarController: _controller,
             events: _events,
             initialCalendarFormat: CalendarFormat.week,
             calendarStyle: CalendarStyle(
                 canEventMarkersOverflow: true,
                 todayColor: Colors.orange,
                 selectedColor: Theme.of(context).primaryColor,
                 todayStyle: TextStyle(
                     fontWeight: FontWeight.bold,
                     fontSize: 18.0,
                     color: Colors.white)),
             headerStyle: HeaderStyle(
               centerHeaderTitle: true,
               formatButtonDecoration: BoxDecoration(
                 color: Colors.orange,
                 borderRadius: BorderRadius.circular(20.0),
               ),
               formatButtonTextStyle: TextStyle(color: Colors.white),
               formatButtonShowsNext: false,
             ),
             startingDayOfWeek: StartingDayOfWeek.monday,
             onDaySelected: (date, events) {
               setState(() {
                 _selectedEvents = events;
               });
             },
             builders: CalendarBuilders(
               selectedDayBuilder: (context, date, events) => Container(
                   margin: const EdgeInsets.all(4.0),
                   alignment: Alignment.center,
                   decoration: BoxDecoration(
                       color: Theme.of(context).primaryColor,
                       borderRadius: BorderRadius.circular(10.0)),
                   child: Text(
                     date.day.toString(),
                     style: TextStyle(color: Colors.white),
                   )),
               todayDayBuilder: (context, date, events) => Container(
                   margin: const EdgeInsets.all(4.0),
                   alignment: Alignment.center,
                   decoration: BoxDecoration(
                       color: Colors.orange,
                       borderRadius: BorderRadius.circular(10.0)),
                   child: Text(
                     date.day.toString(),
                     style: TextStyle(color: Colors.white),
                   )),
             ),

           ),
           ..._myTaskList.map((event) => Padding(
             padding: const EdgeInsets.all(8.0),
             child: Container(
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10),
                 color: Colors.white,
                 boxShadow: [
                   BoxShadow(color: Colors.green,),
                 ],
               ),
               child: Column(
                 children: <Widget>[
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text("${event.categoryTitle.categoryTitle}", style: GoogleFonts.poppins(
                       color:Colors.redAccent,
                       fontWeight: FontWeight.bold
                         
                     )),
                   ),
                   Divider(height: 3.0, color: Colors.deepPurple),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: ListTile(
                       leading: Row(
                         mainAxisSize: MainAxisSize.min,
                         children: [

                           VerticalDivider(color: Colors.green,width: 5.0,),
                         ],
                       ),
                       title: Text(event.taskname, style: GoogleFonts.poppins(
                         fontWeight: FontWeight.bold,
                         fontSize: 20.0,
                       ),),
                       subtitle: Text(event.description, style: GoogleFonts.poppins(
                         fontWeight: FontWeight.bold,
                         fontSize: 15.0,
                       ),),

                       trailing: ImageIcon(
                         AssetImage("assets/dots.png"),
                         color: Color(0xFF3A5A98),
                       ),

                       onTap: () {
//               Navigator.push(context, MaterialPageRoute(builder: (_) => EventDetailsPage(event: event,)));
                       },
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(top: 18.0, bottom: 24.0),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: <Widget>[
                       Icon(Icons.watch_later,color: Colors.grey,),
                       Icon(Icons.people_outline,color: Colors.grey,),
                       Icon(Icons.share,color: Colors.grey,),
                     ],),
                   )
                 ],
               ),
             ),
           )),
         ],
       ),
     ),
   );
  }
}
