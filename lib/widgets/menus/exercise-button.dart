import 'package:flutter/material.dart';
import 'package:handrills/constants.dart';

class ExerciseButton extends StatelessWidget {
  const ExerciseButton({
    Key? key,
    required this.destination,
    required this.label,
    required this.imagePath,
  }) : super(key: key);

  final Widget destination;
  final String label;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Container(
        height: 140,
        width: (screenWidth / 2) - 15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: OutlinedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => destination),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: label.length * 13.0,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 2, color: ACCENT_COLOR),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 30,
                        bottom: 10,
                      ),
                      child: Text(
                        label,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
