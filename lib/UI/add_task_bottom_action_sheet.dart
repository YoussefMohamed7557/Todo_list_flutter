import 'package:flutter/material.dart';
import 'package:todo_list_flutter/utils/firebase_utilities.dart';
import 'package:todo_list_flutter/utils/ui_utilities.dart';

import '../models/task_model.dart';

class AddTaskBottomActionSheet extends StatefulWidget {

  @override
  State<AddTaskBottomActionSheet> createState() => _AddTaskBottomActionSheetState();
}

class _AddTaskBottomActionSheetState extends State<AddTaskBottomActionSheet> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();
  String taskName = "";
  String taskDescription = "";
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height / 1.5,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Add new task",
                style: Theme.of(context).textTheme.displayMedium,
                textAlign: TextAlign.center,
              ),
              Form(
                  key: formController,
                  child: Column(
                  children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'task name'),
                    onChanged: ( name){
                      taskName = name;
                    },
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "task name required";
                      } else {
                        return null;
                      }
                    },
                  ),
                  TextFormField(
                    onChanged: (description){
                      taskDescription = description;
                    },
                      decoration:
                          InputDecoration(labelText: 'task description'),
                      maxLines: 4,
                      minLines: 4,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return "task name required";
                        } else {
                          return null;
                        }
                      }),
                ],
              )),
              SizedBox(
                height: 16,
              ),
              Text('Task Date',
                  style: Theme.of(context).textTheme.displayMedium,
                  textAlign: TextAlign.center),
              SizedBox(
                height: 8,
              ),
              InkWell(
                onTap: (){
                  chooseDate();
                },
                child: Text(
                    '${selectedDate.year} - ${selectedDate.month} - ${selectedDate.day}',
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(color: Theme.of(context).primaryColor),
                    textAlign: TextAlign.center),
              ),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  addTask();
                },
                child: Text(
                  "Add Task",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 22),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(16))),
              )
            ],
          ),
        ),
      ),
    );
  }

  void addTask() {
      if(formController.currentState?.validate() == true){
        Task task = Task(name: taskName,description: taskDescription,date_in_milliSecond: DateUtils.dateOnly(selectedDate).millisecondsSinceEpoch);
        showLoadingDialog(context, false, 'loading ...');
        addTaskToFireStore(task)
            .then((value) {
          //Task added successfully
          removeDialog(context);
          notifyUserWithFeedbackDialog(context, false, "task added successfully", "ok", () {
            Navigator.pop(context);
            Navigator.pop(context);
          },);
        },).catchError((onError){
          //get error
          removeDialog(context);
          notifyUserWithFeedbackDialog(context, false, "some thing went wrong .. try again ", "positiveActionText", () {
            Navigator.pop(context);
          },);
        });
    }
  }

  Future<void> chooseDate() async {
    var date = await showDatePicker(context: context,initialDate: selectedDate, firstDate: DateTime.now(), lastDate: DateTime.now().add(Duration(days: 365)));
    if (date != null){
      selectedDate = date;
    }
    setState(() {});
  }
}
