import 'package:flutter/material.dart';

TimeOfDay selectedTime = new TimeOfDay.now();
Future<Null> _selectTimeStamp(BuildContext context, TextEditingValue timetext) async{

 final TimeOfDay timePicked = await showTimePicker(
        context: context,
        initialTime: selectedTime,
    );

 if(timePicked != null && timePicked != selectedTime){
   selectedTime = timePicked;
 }

}