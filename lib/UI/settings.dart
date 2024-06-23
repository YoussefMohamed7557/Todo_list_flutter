
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: 80,color: Theme.of(context).primaryColor,),
        Spacer(),
        Padding(padding: EdgeInsets.all(16.0),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("language",style: Theme.of(context).textTheme.displayMedium?.copyWith(color:Colors.black87),),
            InkWell(
              onTap: (){
                //showLanguageBottomSheet();
              },
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("English", style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400,color:Colors.black87),),
                    Icon(Icons.arrow_drop_down_circle_outlined,size: 28,color: Colors.black54,)
                  ],
                ),

                margin: EdgeInsets.all(12),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(color:Colors.white,borderRadius: BorderRadius.circular(12),border: Border.all(color:Colors.black87)),
              ),
            ),
            Text("Mode",style: Theme.of(context).textTheme.displayMedium?.copyWith(color:Colors.black87),),
            InkWell(
              onTap: (){
                //showThemeBottomSheet();
              },
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("light mode", style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400,color: Colors.black87),),
                    Icon(Icons.arrow_drop_down_circle_outlined,size: 30,color: Colors.black54,)
                  ],
                ),
                margin: EdgeInsets.all(12),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(color:Colors.white,borderRadius: BorderRadius.circular(12),border: Border.all(color: Colors.black87)),
              ),
            )
          ],
        ), ),
        Spacer(flex: 3,),
      ],
    );
  }
}
