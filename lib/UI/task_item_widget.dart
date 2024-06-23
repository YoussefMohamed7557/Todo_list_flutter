import 'package:flutter/material.dart';
import 'package:todo_list_flutter/models/task_model.dart';

class TaskListItem extends StatelessWidget{
  Task task;
  TaskListItem(this.task);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(borderRadius: BorderRadiusDirectional.circular(8.0),color: Theme.of(context).colorScheme.secondary,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(color: Theme.of(context).primaryColor,width: 2,height: 100,),
          SizedBox(width: 12,),
          Expanded(
            flex: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(task.name,style: Theme.of(context).textTheme.displayMedium,),
                ),
              Text(task.description,style: Theme.of(context).textTheme.displaySmall,maxLines: 6,),
              ],
            ),
          ),
          SizedBox(width: 12,),
          Expanded(flex : 5,child: Container(child: Icon(Icons.check,color: Theme.of(context).colorScheme.secondary,size: 32,),width:80,height: 40,decoration: BoxDecoration(color: Theme.of(context).primaryColor,borderRadius: BorderRadius.circular(8)),))
        ],
      ),
    );
  }
}
