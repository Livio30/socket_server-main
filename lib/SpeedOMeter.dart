import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

typedef MapCallback = void Function(bool value);

class SpeedOMeterWidget extends StatefulWidget {
  bool visiblity;
  final MapCallback fullScreenMode;

  SpeedOMeterWidget(
      {super.key, required this.visiblity, required this.fullScreenMode});

  @override
  State<SpeedOMeterWidget> createState() => _SpeedOMeterWidgetState();
}

class _SpeedOMeterWidgetState extends State<SpeedOMeterWidget> {
  bool fullScreen = false;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.visiblity,
      child: GestureDetector(
        onHorizontalDragUpdate: (details) {
          double sensitivity = 8;
          if (details.primaryDelta! > sensitivity) {
            setState(() {
              print("Right");
              fullScreen = true;
              widget.fullScreenMode(fullScreen);
            });
          } else if (details.primaryDelta! < -sensitivity) {
            setState(() {
              print("Left");
              fullScreen = false;
              widget.fullScreenMode(fullScreen);
            });
          }
        },
        child: AnimatedCrossFade(
          crossFadeState:
              fullScreen ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 250),
          firstChild: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            width: fullScreen ? 869 : 293.3,
            margin: fullScreen
                ? EdgeInsets.all(0)
                : EdgeInsets.fromLTRB(15, 15, 0, 15),
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: SvgPicture.asset('./images/speedON.svg', fit: BoxFit.fill),
          ),
          secondChild: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            // width: 869,
            width: fullScreen ? 869 : 293.3,
            margin: EdgeInsets.all(0),
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: fullScreen
                  ? BorderRadius.all(Radius.circular(0))
                  : BorderRadius.all(Radius.circular(10)),
            ),
            child: SvgPicture.asset('./images/speedOFs.svg'),
          ),
        ),
      ),
    );
  }
}
