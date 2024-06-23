import 'package:flutter/material.dart';

class TaskListItem extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(borderRadius: BorderRadiusDirectional.circular(8.0),color: Theme.of(context).colorScheme.secondary,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(color: Theme.of(context).primaryColor,width: 2,height: 80,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text("Task Name Placeholder",style: Theme.of(context).textTheme.displayMedium,),
              ),
              Text("12.00",style: Theme.of(context).textTheme.displaySmall),
            ],
          ),
          Container(child: Icon(Icons.check,color: Theme.of(context).colorScheme.secondary,size: 32,),width:80,height: 40,decoration: BoxDecoration(color: Theme.of(context).primaryColor,borderRadius: BorderRadius.circular(4)),)
        ],
      ),

    );
  }
}
