import 'package:flutter/material.dart';
import 'package:todo_list_flutter/settings.dart';
import 'package:todo_list_flutter/task_list.dart';

class HomePage extends StatefulWidget {
  static const rout_name = "HomePage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selctedIndex = 0;
  List<Widget> tabList = [TaskList(), Settings()];
  List<String> titleList = ["To Do List", "Settings"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(120.0),
          child: AppBar(
            title: Text(
              titleList[selctedIndex],
              style: Theme.of(context).textTheme.displayLarge,
            ),
          )),
      body: tabList[selctedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.large(

        child: Icon(Icons.add,),
        onPressed: () {},
        shape: CircleBorder(),
      ),
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 90,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          onTap: (value) {
            selctedIndex = value;
            setState(() {});
          },
          currentIndex: selctedIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.list_outlined,
                  size: 44,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings, size: 44), label: '')
          ],
        ),
      ),
    );
  }
}
