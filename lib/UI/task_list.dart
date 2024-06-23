import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timeline_calendar/timeline/model/calendar_options.dart';
import 'package:flutter_timeline_calendar/timeline/model/day_options.dart';
import 'package:flutter_timeline_calendar/timeline/model/headers_options.dart';
import 'package:flutter_timeline_calendar/timeline/utils/calendar_types.dart';
import 'package:flutter_timeline_calendar/timeline/utils/calendar_utils.dart';
import 'package:flutter_timeline_calendar/timeline/widget/timeline_calendar.dart';
import 'package:todo_list_flutter/UI/task_item_widget.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TimelineCalendar(
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
                      print(datetime.getDate());
                 },
        ),
        Expanded(
          child: ListView.builder(
              itemCount: 22, itemBuilder: (context, index) => TaskListItem()),
        ),
      ],
    );
  }
}
