import 'package:flutter/material.dart';
import 'package:mad_layout_assignment_part2/main.dart';

class Controller extends StatefulWidget {
  late Choice device;

  //constructor
  Controller(Choice device) {
    this.device = device;
  }

  @override
  State<Controller> createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey.shade200, spreadRadius: 2),
        ],
      ),
      child: Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                widget.device.power[0]
                    ? Icon(
                        widget.device.icon,
                        color: Colors.blue,
                        size: 40,
                      )
                    : Icon(
                        widget.device.icon,
                        color: Colors.grey,
                        size: 40,
                      ),
                ToggleButtons(
                  children: const <Widget>[
                    Icon(Icons.power_settings_new),
                  ],
                  isSelected: widget.device.power,
                  color: Colors.grey,
                  selectedColor: Colors.green,
                  fillColor: Colors.transparent,
                  borderRadius: BorderRadius.circular(50),
                  selectedBorderColor: Colors.green,
                  onPressed: (int index) {
                    setState(() {
                      widget.device.power[index] = !widget.device.power[index];
                    });
                  },
                ),
              ]),
          SizedBox(
            height: 10,
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "${widget.device.title}",
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: widget.device.power[0]
                      ? const Text(
                          "On",
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.green),
                        )
                      : const Text(
                          "Off",
                          textAlign: TextAlign.left,
                        ),
                ),
              ]),
        ],
      ),
    );
  }
}
