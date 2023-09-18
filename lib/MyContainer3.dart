import 'package:flutter/material.dart';

class MyContainer3 extends StatelessWidget {
  MyContainer3({super.key,});
  
  static String id = "3";

  @override
  Widget build(BuildContext context) {
    
        return Draggable<String>(
          data: id,
          child: Container(
            height: 100,
            width: 100,
            color: Colors.blueAccent,
          ),
          feedback: Container(
            height: 120,
            width: 120,
            color: Colors.blueAccent,
          ),
          childWhenDragging: Container(
            height: 100.0,
            width: 100.0,
            color: Colors.grey,
          ),
        );
  }
}