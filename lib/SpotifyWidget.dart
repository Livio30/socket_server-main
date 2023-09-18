import 'package:comm/animationController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SpotifyWidget extends StatelessWidget {
  
  SpotifyWidget({super.key,});
  
  static String id = "1";

  @override
  Widget build(BuildContext context) {
    
        return Draggable<String>(
          data: id,
          
          feedback: Container(
            height: 120,
            width: 120,
            color: Colors.amberAccent,
          ),
          childWhenDragging: Container(
            height: 100.0,
            width: 100.0,
            color: Colors.grey,
          ),
          child: GetBuilder<UIController>(builder: (uiCOntroller){
            return AnimatedCrossFade(
                          crossFadeState: uiCOntroller.oneWidgetLg
                              ? CrossFadeState.showFirst
                              : CrossFadeState.showSecond,
                          duration: const Duration(milliseconds: 200),
                          firstChild: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            height: uiCOntroller.oneWidgetLg ? 259 : 60,
                            width: 259,
                            margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            // child: SvgPicture.asset('./images/spotifyMd.svg'),
                            child: Image.asset(
                              'images/spotifyMd.png',
                            ),
                          ),
                          secondChild: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            height: uiCOntroller.oneWidgetLg ? 259 : 60,
                            width: 259,
                            margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: SvgPicture.asset('./images/spotifySm.svg',
                                fit: BoxFit.fill),
                          ),
                        );
          }),
        );
  }
}
