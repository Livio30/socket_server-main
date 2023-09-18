import 'dart:typed_data';

import 'package:comm/SpotifyWidget.dart';
import 'package:comm/BatteryWidget.dart';
import 'package:comm/MyContainer3.dart';
import 'package:comm/MyContainer4.dart';
import 'package:comm/server.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:network_info_plus/network_info_plus.dart';

class ServerController extends GetxController {
  Server? server;
  List<String> serverLogs = [];
  TextEditingController messageController = TextEditingController();
  Widget? w1 = SpotifyWidget();
  String? w1ID = SpotifyWidget.id;
  Widget? w2 = BatteryWidget();
  String? w2ID = BatteryWidget.id;
  static bool isConnected = false;
  String? ip = "null";

  @override
  void onInit() {
    // TODO: implement onInit
    server = Server(OnData, onError);
    print("Controller INit");
    var networkStatus = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      // Got a new connectivity status!
      switch (result) {
        case ConnectivityResult.wifi:
          
          print("Wifi");
          
          startOrStopServer();
          isConnected = true;
          break;
        default:
          if(server!.running){
            startOrStopServer();
          }
          
          print("Default");
      }
    });
    
    super.onInit();
  }

  

  Future<void> startOrStopServer() async {
    final info = NetworkInfo();
    ip = await info.getWifiIP();
    print("NetworkIp : $ip");
    
    if ( server != null && server!.running) {
      await server!.close();
      serverLogs.clear();
      print("Connection Closed");
    } else {
      print("$isConnected isconnected" );
      if(isConnected){
        await server!.start(ip!);
      print("Connected to $ip");
      }else{
        print("else startOrStopServer");
      }
      
    }
    update();
  }

  void OnData(Uint8List data) {
    String receviedData = String.fromCharCodes(data);
    
    List splitData = receviedData.split(" ");
    print("Split data : ${splitData[0]} ${splitData[1]} ${splitData[2]}");

    if(splitData[2].toString() == "d"){
      print("Ack data : ${getCurrentWidgetId(splitData[1])} ${splitData[1]}");
      handleMessage("${getCurrentWidgetId(splitData[1].toString())} ${splitData[1]} a");
    }
    setWidget(splitData[1], getWidget(splitData[0]), splitData[0]);
    serverLogs.add(receviedData);
    update();
  }

  void onError(dynamic error) {
    debugPrint("Error: $error");
  }

  void handleMessage(String msg) {
    server!.broadcast(msg);
    
    serverLogs.add(msg);
    update();
  }

  Widget getWidget(String id){

    switch (id) {
      case "1":
        return SpotifyWidget();
      case "2":
        return BatteryWidget();
      case "3":
        return MyContainer3();
      case "4":
        return MyContainer4();
      default:
        return const Text("Error Occured");
    }
  }

  String getCurrentWidgetId(String pos){

    switch (pos) {
      case "1":
        return w1ID!;
      case "2":
        return w2ID!;
      default:
        print("IN getCurrentWidget default");
        return "error";
    }
  }

  void setWidget(String pos, Widget w, String widgetID){
    switch (pos) {
      case "1":
        w1 = w;
        w1ID = widgetID;
        break;
      case "2":
        w2 = w;
        w2ID = widgetID;
        break;
      default:
        print("Inside Set Widget Deafult");


    }
  }

  void swapWidget(String ID1,String ID2){

    print("swap $ID1 and $ID2");

    w1 = getWidget(ID2);
    w2 = getWidget(ID1);

    w1ID = ID2;
    w2ID = ID1;


    update();
  }

}
