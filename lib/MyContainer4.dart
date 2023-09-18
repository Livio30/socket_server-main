import 'package:flutter/material.dart';

class MyContainer4 extends StatelessWidget {
  MyContainer4({super.key,});
  
  static String id = "4";

  @override
  Widget build(BuildContext context) {
    
        return Draggable<String>(
          data: id,
          child: Container(
            height: 100,
            width: 100,
            color: Colors.greenAccent,
          ),
          feedback: Container(
            height: 120,
            width: 120,
            color: Colors.greenAccent,
          ),
          childWhenDragging: Container(
            height: 100.0,
            width: 100.0,
            color: Colors.grey,
          ),
        );
  }
}