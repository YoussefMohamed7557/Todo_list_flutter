import 'package:flutter/material.dart';
import 'package:todo_list_flutter/models/task_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_list_flutter/utils/firebase_utilities.dart';

class TaskListItem extends StatelessWidget {
  Task task;
  TaskListItem(this.task);

  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).colorScheme.primary;
    Color onPrimary = Theme.of(context).colorScheme.onPrimary;
    return Slidable(
      startActionPane: ActionPane(
        extentRatio: 0.25,
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              deleteTask(task);
            },
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          )
        ],
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(8.0),
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              color: task.isDone?onPrimary:primary,
              width: 2,
              height: 100,
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              flex: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      task.name,
                      style: Theme.of(context).textTheme.displayMedium?.copyWith(color: task.isDone?onPrimary:Colors.black87,),
                    ),
                  ),
                  Text(
                    task.description,
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(color: task.isDone?onPrimary:Colors.black87,),
                    maxLines: 6,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 12,
            ),
            task.isDone ?
            Text("Done !",style: Theme.of(context).textTheme.displayLarge?.copyWith(color: Colors.green,fontWeight: FontWeight.w700),)
            :Expanded(
                flex: 5,
                child: InkWell(
                    onTap: () {
                      task.isDone = true;
                      updateStoredTask(task);
                    },
                    child: Container(
                      child: Icon(
                        Icons.check,
                        color: Theme.of(context).colorScheme.secondary,
                        size: 32,
                      ),
                      width: 80,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(8)),
                    )))
          ],
        ),
      ),
    );
  }
}
