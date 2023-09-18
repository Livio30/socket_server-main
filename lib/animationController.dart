import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UIController extends GetxController {

  bool fullScreen = false;
  bool oneWidgetLg = true;
  bool twoWidgetLg = false;
  bool extendedConnected = false;
  List<bool> widgetSize = [true, false, false];
  var widgetKey = UniqueKey();
  int widgetNum = 0;
  final PageController pageController = new PageController();

  @override
  void onInit() {
  
    
    super.onInit();
  }

  void toggle(bool value){
    oneWidgetLg = !value;
    print("toggled $oneWidgetLg");
    update();
  }

  


}
