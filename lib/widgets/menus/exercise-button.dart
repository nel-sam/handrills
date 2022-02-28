import 'package:flutter/material.dart';
import 'package:handrills/constants.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';

class ExerciseButton extends StatelessWidget {
  final Widget destination;
  final IconData icon;
  final String label;
  final String hanLabel;
  final bool halfWidth;

  const ExerciseButton({
    Key? key,
    required this.destination,
    required this.label,
    required this.hanLabel,
    required this.icon,
    this.halfWidth = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = Nrs.getScreenWidth();
    double buttonWidth =
        this.halfWidth ? (screenWidth / 2) - 20 : screenWidth - 30;
    double buttonHeight = halfWidth ? 130 : 130;
    var appBarColor = Nrs.isDarkTheme(context)
        ? Color.fromARGB(255, 58, 58, 58)
        : Nrs.getAppBarColor();
    double radius = 10;

    return Padding(
      padding: const EdgeInsets.all(FONT_SIZE / 2),
      child: Container(
        height: buttonHeight,
        width: buttonWidth,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 10,
            primary: appBarColor,
            onSurface: appBarColor,
            padding: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius)),
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => destination),
            );
          },
          child: halfWidth
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: buttonWidth,
                      height: buttonHeight / 2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(radius),
                          topLeft: Radius.circular(radius),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: FONT_SIZE),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          getLabel(),
                          getIcon(),
                        ],
                      ),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: FONT_SIZE),
                            child: getLabel())
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: buttonHeight,
                          height: buttonHeight,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(radius),
                              bottomRight: Radius.circular(radius),
                            ),
                          ),
                          child: getIcon(),
                        ),
                      ],
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Icon getIcon() {
    return Icon(
      icon,
      size: 50,
    );
  }

  Widget getLabel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hanLabel,
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: halfWidth ? 12 : 14,
          ),
        ),
      ],
    );
  }
}
