import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.history, required this.selectedDate,
  required this.changeSelectedDate }) : super(key: key);
  final Map<DateTime, Map<String, double>> history;
  final DateTime selectedDate;
  final changeSelectedDate;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Widget showGraph() {
    if (widget.history.containsKey(widget.selectedDate)) {
      return PieChart(dataMap: widget.history[widget.selectedDate]?? {"fuck": 0});
    }
    else {
      return Text("No summary on ${widget.selectedDate.toString().split(' ')[0]} :(");
    }
  }

  @override
  Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: (){
                  widget.changeSelectedDate(
                    widget.selectedDate.subtract(Duration(days: 1))
                  );
                }, icon: Icon(Icons.keyboard_arrow_left)),
                Text(widget.selectedDate.toString().split(' ')[0]),
                IconButton(onPressed: (){
                  widget.changeSelectedDate(
                      widget.selectedDate.add(Duration(days: 1))
                  );
                }, icon: Icon(Icons.keyboard_arrow_right)),
              ],
            ),
            showGraph(),
          ],
        ),
      );
  }
}

