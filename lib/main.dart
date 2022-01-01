import 'package:flutter/material.dart';
import 'controller.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 3,
            child: Scaffold(
                appBar: AppBar(
                  title: Text("Home"),
                  bottom: const TabBar(
                    tabs: [
                      Tab(text: "All"),
                      Tab(text: "Living Room"),
                      Tab(text: "Kitchen"),
                    ],
                  ),
                ),
                body: TabBarView(children: [
                  Container(
                      child: GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 8.0,
                    children: choices.map((device) {
                      return Controller(device);
                    }).toList(),
                  )),
                  Container(
                      child: GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 8.0,
                    children: livingRoom.map((device) {
                      return Controller(device);
                    }).toList(),
                  )),
                  Container(
                      child: GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 8.0,
                    children: kitchen.map((device) {
                      return Controller(device);
                    }).toList(),
                  ))
                ]))));
  }
}

class Choice {
  late String title;
  late IconData icon;
  late List<bool> power;
  late String rooms;
  Choice(String title, IconData icon, String rooms) {
    this.title = title;
    this.icon = icon;
    this.power = [false];
    this.rooms = rooms;
  }
}

List<Choice> choices = <Choice>[
  Choice('Alexa', Icons.home, "Kitchen"),
  Choice('TV', Icons.tv, "Living Room"),
  Choice('Computer', Icons.computer, "Living Room"),
  Choice('AC', Icons.ac_unit, "Living Room"),
  Choice('FoodBank', Icons.food_bank, "Kitchen"),
  Choice('Phone', Icons.phone, "Kicten"),
  Choice('Microwave Oven', Icons.microwave, "Kitchen"),
  Choice('WiFi', Icons.wifi, "Living Room"),
];
late List<Choice> livingRoom =
    choices.where((device) => device.rooms == "Living Room").toList();
late List<Choice> kitchen =
    choices.where((device) => device.rooms == "Kitchen").toList();

class SelectCard extends StatelessWidget {
  const SelectCard({Key? key, required this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle? textStyle = Theme.of(context).textTheme.headline4;
    return Card(
        color: Colors.white,
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(choice.icon,
                            size: 50.0, color: textStyle!.color))),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(choice.title, style: textStyle)),
              ]),
        ));
  }
}
