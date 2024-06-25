import 'package:flutter/material.dart';

void showLoadingDialog(BuildContext context,bool isCancellable,String message){
  showDialog(barrierDismissible : isCancellable ,
    context: context,
    builder: (context) {
    return AlertDialog(
      content: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(message, style: Theme.of(context).textTheme.displayMedium,),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircularProgressIndicator(),
          )
        ],
      ),
    );
  },);
}
void removeDialog(BuildContext context){
  Navigator.pop(context);
}
void notifyUserWithFeedbackDialog(
    BuildContext context,bool isCancellable,String message,
    String positiveActionText,VoidCallback positiveAction,
    {String? negativeActionText,VoidCallback? negativeAction,}
    ){
  List<TextButton> actionsList = [TextButton(onPressed: (){positiveAction();}, child: Text(positiveActionText))];
  if(negativeActionText != null && negativeAction != null){
    actionsList.add(TextButton(onPressed: (){negativeAction();}, child: Text(negativeActionText)));
  }
  showDialog(barrierDismissible : isCancellable ,
    context: context,
    builder: (context) {
      return AlertDialog(
        actions: actionsList,
        content: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:Text(message, style: Theme.of(context).textTheme.displayMedium,),
            ),
          ],
        ),
      );
    },);
}