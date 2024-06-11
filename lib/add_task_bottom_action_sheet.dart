import 'package:flutter/material.dart';
class AddTaskBottomActionSheet extends StatelessWidget {
  const AddTaskBottomActionSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height/1.5,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Add new task",style: Theme.of(context).textTheme.displayMedium,textAlign: TextAlign.center,),
              Form(child: Column(
                children: [
                  TextFormField(decoration: InputDecoration(labelText: 'task name'),),
                  TextFormField(decoration: InputDecoration(labelText: 'task description'),maxLines: 4,minLines: 4,),
                ],
              )),
              SizedBox(height: 16,),
              Text('Task Date',style: Theme.of(context).textTheme.displayMedium,textAlign: TextAlign.center),
              SizedBox(height: 8,),
              Text('${DateTime.now().year} - ${DateTime.now().month} - ${DateTime.now().day}',style: Theme.of(context).textTheme.displaySmall?.copyWith(color: Theme.of(context).primaryColor),textAlign: TextAlign.center),
              SizedBox(height: 16,),
              ElevatedButton(onPressed: (){},
                  child: Text("Add Task",style: TextStyle(color: Theme.of(context).colorScheme.secondary,fontSize: 22),)
                  ,style: ElevatedButton.styleFrom(backgroundColor:Theme.of(context).primaryColor,
                    shape:ContinuousRectangleBorder(borderRadius: BorderRadius.circular(16))),)
            ],
          ),
        ),
      ),
    );
  }
}
