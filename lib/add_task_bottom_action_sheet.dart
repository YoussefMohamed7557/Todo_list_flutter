import 'package:flutter/material.dart';

class AddTaskBottomActionSheet extends StatefulWidget {

  @override
  State<AddTaskBottomActionSheet> createState() => _AddTaskBottomActionSheetState();
}

class _AddTaskBottomActionSheetState extends State<AddTaskBottomActionSheet> {
  GlobalKey<FormState> formController = GlobalKey();
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
    bool isValid = formController.currentState!.validate();
    if(isValid){
      // if valid case insert the new task
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
