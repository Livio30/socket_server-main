import 'dart:async';

import 'package:comm/ScrollColumn.dart';
import 'package:comm/SpeedOMeter.dart';
import 'package:comm/animationController.dart';
import 'package:comm/controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Server'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  ServerController serverController = ServerController();
  late Timer _timer;
  var networkStatus;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    networkStatus.cancel();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

          body: Center(
            child: GetBuilder<ServerController>(
              init: ServerController(),
              builder: (controller) {
                print(controller.serverLogs);
                return GetBuilder<UIController>(
                    init: UIController(),
                    builder: (uiController) {
                      return Center(
                        child: Container(
                          width: 915,
                          height: 412,
                          color: Colors.black87,
                          child: Row(
                            children: [
                              SpeedOMeterWidget(
                                  visiblity: true,
                                  fullScreenMode: uiController.fullScreen
                                      ? (value) {
                                          _timer = new Timer(
                                              const Duration(milliseconds: 250),
                                              () {
                                            setState(() => uiController
                                                .fullScreen = value);
                                          });
                                        }
                                      : (value) => setState(() =>
                                          uiController.fullScreen = value)),
                              ScrollColumn(
                                colVisiblity: !uiController.fullScreen,
                                fullScreenSpeedo: uiController.fullScreen,
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
            ),
          )),
    );
  }

  void startStopServer() async {}
}
