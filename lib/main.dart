import 'package:flutter/material.dart';
import 'package:nutrisys/calendar.dart';
import 'package:nutrisys/home.dart';
import 'package:nutrisys/addnew.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<DateTime, Map<String, double>> history = {
    DateTime(2023, 1, 22) : {
      "Carbohydrate": 12,
      "Protein": 5,
      "Fat": 6,
      "Etc": 3,
    },
    DateTime(2023, 1, 23) : {
      "Carbohydrate": 13,
      "Protein": 8,
      "Fat": 7,
      "Etc": 4,
    },
  };
  DateTime selectedDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  int tab = 0;

  void changeTabTo(int tabIndex) {
    setState(() {
      tab = tabIndex;
    });
  }

  void changeSelectedDate(DateTime date) {
    setState(() {
      selectedDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {

    List tabs = [
      Home(history : history, selectedDate : selectedDate, changeSelectedDate: changeSelectedDate),
      Calendar(history : history, changeTabTo : changeTabTo, changeSelectedDate : changeSelectedDate),
      AddNew(history: history)];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("NutriSys"),
        toolbarHeight: 75,
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.settings)
          )],
      ),
      body: tabs[tab],
      bottomNavigationBar: SizedBox(
        height: 75,
        child: BottomNavigationBar(
          currentIndex: tab,
          onTap: (index) { changeTabTo(index); },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: "Calendar"),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add"),
          ],
        ),
      ),
    );
  }
}
