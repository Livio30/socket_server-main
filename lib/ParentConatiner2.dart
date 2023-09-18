import 'package:comm/animationController.dart';
import 'package:comm/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ParentConatainer2 extends StatelessWidget {
  final Widget widget;

  final String widgetID;
  final String parentID = "2";
  ParentConatainer2({super.key, required this.widget, required this.widgetID});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ServerController>(builder: (controller) {
      return DragTarget(
        builder: (BuildContext context, List<Object?> candidateData,
            List<dynamic> rejectedData) {
          return GetBuilder<UIController>(builder: (uiCOntroller) {
            return GestureDetector(
                onTap: () => uiCOntroller.toggle(uiCOntroller.oneWidgetLg),
                onDoubleTap: () {
                  print("Tapped $widgetID $parentID ");
                  controller.handleMessage("$widgetID $parentID d");
                },
                child: widget);
          });
        },
        onAccept: (String data) {
          print('Accepted');
          controller.swapWidget(data, widgetID);
        },
      
      );
    });
  }
}
