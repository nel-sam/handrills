import 'package:flutter/material.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';

class HDNumberBlock extends StatelessWidget {
  final int digit;
  final List<String> numberList;

  const HDNumberBlock({
    Key? key,
    required this.digit,
    required this.numberList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double radius = 10;

    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 10,
            minimumSize: Size(250, 250),
            padding: const EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius)),
            ),
          ),
          onPressed: () {},
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  digit.toString(),
                  style: TextStyle(
                    fontSize: 18,
                    color: Nrs.getPrimaryColor(context),
                  ),
                ),
                Text(
                  numberList[0],
                  style: TextStyle(
                    fontSize: 18,
                    color: Nrs.getPrimaryColor(context),
                  ),
                ),
                numberList[1] != '' && numberList[0] != numberList[1]
                    ? Text(
                        numberList[1],
                        style: TextStyle(
                          fontSize: 18,
                          color: Nrs.getPrimaryColor(context),
                        ),
                      )
                    : Container(),
              ]),
        ),
      ),
    );
  }
}
