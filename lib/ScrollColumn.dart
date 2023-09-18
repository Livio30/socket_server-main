import 'package:comm/ParentConatiner2.dart';
import 'package:comm/ParentConatiner.dart';
import 'package:comm/controller.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ScrollColumn extends StatefulWidget {
  bool colVisiblity;
  bool fullScreenSpeedo;
  ScrollColumn(
      {super.key, required this.colVisiblity, required this.fullScreenSpeedo});
  @override
  State<ScrollColumn> createState() => _ScrollColumnState();
}

class _ScrollColumnState extends State<ScrollColumn> {
  bool oneWidgetLg = true;
  bool twoWidgetLg = false;
  bool extendedConnected = false;
  List<bool> widgetSize = [true, false, false];
  var widgetKey = UniqueKey();
  int widgetNum = 0;
  final PageController pageController = new PageController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ServerController>(builder: (controller){
      return Visibility(
      visible: !widget.fullScreenSpeedo,
      child: Row(
        children: [
// --------------- 1st Column ---------------
          Container(
            // color: Colors.amber,
            height: MediaQuery.of(context).size.height,
            width: 259,
            // width: double.infinity,
            margin: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: widget.colVisiblity ? 1.0 : 0.0,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height,
                  scrollDirection: Axis.vertical,
                  viewportFraction: 1.0,
                  scrollPhysics: extendedConnected
                      ? const NeverScrollableScrollPhysics()
                      : const AlwaysScrollableScrollPhysics(),
                ),
                items: [
                  Column(
                    children: [
                      // --------------- Spotify Widget ---------------
                      ParentConatainer(widget: controller.w1!, widgetID: controller.w1ID!),
                      // --------------- Battery Widget ---------------
                      ParentConatainer2(widget: controller.w2!, widgetID: controller.w2ID!)
                    ],
                  ),
                  Column(
                    children: [
                      // --------------- TripInfo Widget ---------------
                      GestureDetector(
                        onLongPressMoveUpdate: (details) {
                          int sensitivity = 8;
                          if (details.offsetFromOrigin.dy > sensitivity) {
                            setState(() {
                              print("Swipe Down");
                              oneWidgetLg = true;
                            });
                          } else if (details.offsetFromOrigin.dy <
                              -sensitivity) {
                            setState(() {
                              print("Swipe Up");
                              oneWidgetLg = false;
                            });
                          }
                        },
                        child: AnimatedCrossFade(
                          crossFadeState: oneWidgetLg
                              ? CrossFadeState.showFirst
                              : CrossFadeState.showSecond,
                          duration: const Duration(milliseconds: 200),
                          firstChild: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            height: oneWidgetLg ? 259 : 60,
                            width: 259,
                            margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: SvgPicture.asset('./images/tripInfoMd.svg'),
                          ),
                          secondChild: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            height: oneWidgetLg ? 259 : 60,
                            width: 259,
                            margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: SvgPicture.asset('./images/tripInfoSm.svg',
                                fit: BoxFit.fill),
                          ),
                        ),
                      ),
                      // --------------- Weather Widget ---------------
                      GestureDetector(
                        onLongPressMoveUpdate: (details) {
                          int sensitivity = 8;
                          if (details.offsetFromOrigin.dy > sensitivity) {
                            setState(() {
                              print("Swipe Down");
                              oneWidgetLg = true;
                            });
                          } else if (details.offsetFromOrigin.dy <
                              -sensitivity) {
                            setState(() {
                              print("Swipe Up");
                              oneWidgetLg = false;
                            });
                          }
                        },
                        child: AnimatedCrossFade(
                          crossFadeState: oneWidgetLg
                              ? CrossFadeState.showFirst
                              : CrossFadeState.showSecond,
                          duration: const Duration(milliseconds: 200),
                          firstChild: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            height: oneWidgetLg ? 60 : 259,
                            width: 259,
                            margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: SvgPicture.asset(
                              './images/weatherSm.svg',
                              fit: BoxFit.fill,
                            ),
                          ),
                          secondChild: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            height: oneWidgetLg ? 60 : 259,
                            width: 259,
                            margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            // margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: SvgPicture.asset(
                              './images/weatherMd.svg',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
// --------------- 2nd Column ---------------
          Container(
            // color: Colors.amber,
            height: MediaQuery.of(context).size.height,
            width: 259,
            // width: double.infinity,
            margin: const EdgeInsets.fromLTRB(0, 10, 10, 10),
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: widget.colVisiblity ? 1.0 : 0.0,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height,
                  scrollDirection: Axis.vertical,
                  viewportFraction: 1.0,
                  scrollPhysics: extendedConnected
                      ? const NeverScrollableScrollPhysics()
                      : const AlwaysScrollableScrollPhysics(),
                ),
                items: [
                  Column(
                    children: [
                      // --------------- Document Widget ---------------
                      GestureDetector(
                        onLongPressMoveUpdate: (details) {
                          int sensitivity = 8;
                          if (details.offsetFromOrigin.dy > sensitivity) {
                            setState(() {
                              print("Swipe Down");
                              twoWidgetLg = true;
                            });
                          } else if (details.offsetFromOrigin.dy <
                              -sensitivity) {
                            setState(() {
                              print("Swipe Up");
                              twoWidgetLg = false;
                            });
                          }
                        },
                        child: AnimatedCrossFade(
                          crossFadeState: twoWidgetLg
                              ? CrossFadeState.showFirst
                              : CrossFadeState.showSecond,
                          duration: const Duration(milliseconds: 200),
                          firstChild: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            height: twoWidgetLg ? 259 : 60,
                            width: 259,
                            margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                            decoration: const BoxDecoration(
                              // color: Colors.red,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Image.asset(
                              './images/docMd.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          secondChild: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            height: twoWidgetLg ? 259 : 60,
                            width: 259,
                            margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: SvgPicture.asset('./images/docSm.svg',
                                fit: BoxFit.fill),
                          ),
                        ),
                      ),
                      // --------------- Navigation Widget ---------------
                      GestureDetector(
                        onLongPressMoveUpdate: (details) {
                          int sensitivity = 8;
                          if (details.offsetFromOrigin.dy > sensitivity) {
                            setState(() {
                              print("Swipe Down");
                              twoWidgetLg = true;
                            });
                          } else if (details.offsetFromOrigin.dy <
                              -sensitivity) {
                            setState(() {
                              print("Swipe Up");
                              twoWidgetLg = false;
                            });
                          }
                        },
                        child: AnimatedCrossFade(
                          crossFadeState: twoWidgetLg
                              ? CrossFadeState.showFirst
                              : CrossFadeState.showSecond,
                          duration: const Duration(milliseconds: 200),
                          firstChild: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            height: twoWidgetLg ? 60 : 259,
                            width: 259,
                            margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Image.asset(
                              './images/navSm.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          secondChild: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            height: twoWidgetLg ? 60 : 259,
                            width: 259,
                            margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Image.asset(
                              './images/navMd.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      // --------------- RideInfo Widget ---------------
                      GestureDetector(
                        onLongPressMoveUpdate: (details) {
                          int sensitivity = 8;
                          if (details.offsetFromOrigin.dy > sensitivity) {
                            setState(() {
                              print("Swipe Down");
                              twoWidgetLg = true;
                            });
                          } else if (details.offsetFromOrigin.dy <
                              -sensitivity) {
                            setState(() {
                              print("Swipe Up");
                              twoWidgetLg = false;
                            });
                          }
                        },
                        child: AnimatedCrossFade(
                          crossFadeState: twoWidgetLg
                              ? CrossFadeState.showFirst
                              : CrossFadeState.showSecond,
                          duration: const Duration(milliseconds: 200),
                          firstChild: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            height: twoWidgetLg ? 259 : 60,
                            width: 259,
                            margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: SvgPicture.asset(
                              './images/rideStatsMd.svg',
                              fit: BoxFit.fill,
                            ),
                          ),
                          secondChild: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            height: twoWidgetLg ? 259 : 60,
                            width: 259,
                            margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: SvgPicture.asset('./images/rideStatsSm.svg',
                                fit: BoxFit.fill),
                          ),
                        ),
                      ),
                      // --------------- RiderProfile Widget ---------------
                      GestureDetector(
                        onLongPressMoveUpdate: (details) {
                          int sensitivity = 8;
                          if (details.offsetFromOrigin.dy > sensitivity) {
                            setState(() {
                              print("Swipe Down");
                              twoWidgetLg = true;
                            });
                          } else if (details.offsetFromOrigin.dy <
                              -sensitivity) {
                            setState(() {
                              print("Swipe Up");
                              twoWidgetLg = false;
                            });
                          }
                        },
                        child: AnimatedCrossFade(
                          crossFadeState: twoWidgetLg
                              ? CrossFadeState.showFirst
                              : CrossFadeState.showSecond,
                          duration: const Duration(milliseconds: 200),
                          firstChild: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            height: twoWidgetLg ? 60 : 259,
                            width: 259,
                            margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: SvgPicture.asset(
                              './images/riderProfileSm.svg',
                              fit: BoxFit.fill,
                            ),
                          ),
                          secondChild: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            height: twoWidgetLg ? 60 : 259,
                            width: 259,
                            margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            // margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child:
                                SvgPicture.asset('./images/riderProfileMd.svg'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    });
  }
}
