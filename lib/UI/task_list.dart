import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timeline_calendar/timeline/flutter_timeline_calendar.dart';
import 'package:flutter_timeline_calendar/timeline/model/calendar_options.dart';
import 'package:flutter_timeline_calendar/timeline/model/day_options.dart';
import 'package:flutter_timeline_calendar/timeline/model/headers_options.dart';
import 'package:flutter_timeline_calendar/timeline/utils/calendar_types.dart';
import 'package:flutter_timeline_calendar/timeline/widget/timeline_calendar.dart';
import 'package:todo_list_flutter/UI/add_task_bottom_action_sheet.dart';
import 'package:todo_list_flutter/UI/task_item_widget.dart';
import 'package:todo_list_flutter/models/task_model.dart';
import 'package:todo_list_flutter/utils/firebase_utilities.dart';
import 'package:todo_list_flutter/utils/ui_utilities.dart';

class TaskList extends StatefulWidget {
  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  DateTime selectedDate = DateUtils.dateOnly(DateTime.now());
  @override
  void initState() {
    super.initState();
    selectedDate = DateUtils.dateOnly(DateTime.now());
  }
  @override
  Widget build(BuildContext context) {
    List<Task> tasksList = [];
    return Column(
      children: [
        TimelineCalendar(
            dateTime:CalendarDateTime.parseDateTime(selectedDate.toString()),
            calendarType: CalendarType.GREGORIAN,
            calendarLanguage: "en",
            calendarOptions: CalendarOptions(
            viewType: ViewType.DAILY,
            toggleViewType: true,
            headerMonthElevation: 10,
            headerMonthShadowColor: Colors.black26,
            headerMonthBackColor: Colors.transparent,
          ),

          dayOptions: DayOptions(
              todayBackgroundColor: Theme.of(context).primaryColor,
              compactMode: true,
              weekDaySelectedColor: Theme.of(context).primaryColor,
              selectedBackgroundColor: Theme.of(context).primaryColor,
              disableDaysBeforeNow: true),
              headerOptions: HeaderOptions(
              weekDayStringType: WeekDayStringTypes.SHORT,
              monthStringType: MonthStringTypes.FULL,
              backgroundColor: Theme.of(context).primaryColor,
              headerTextColor: Theme.of(context).colorScheme.secondary),
              onChangeDateTime: (datetime) {
              if (datetime != null){
              String dateString = datetime.toString();
              DateTime date = DateTime.parse(dateString);
              selectedDate = DateUtils.dateOnly(date);
              print(selectedDate);
                setState(() {});
              }
            }
        ),
        Expanded(
          child:FutureBuilder<QuerySnapshot<Task>>(
          future: getTasks(selectedDate.millisecondsSinceEpoch),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }else if (snapshot.hasError){
              return Column(
                children: [
                  Text("error while loading data, check network and try again",style:Theme.of(context).textTheme.displayMedium?.copyWith(color: Colors.red) ,)
                  ,ElevatedButton(onPressed: (){
                                    setState(() {});
                                    },
                        child: Text("try again"))
                ],
              );
            }else{
              tasksList = snapshot.data?.docs.map((element){return element.data();}).toList()?? [];
              return ListView.builder(itemBuilder: (context, index) => TaskListItem(tasksList[index]),
                itemCount: tasksList.length,
              );
            }
          } ,
        ),
      ),
    ]
    );
  }
}
