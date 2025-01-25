import 'package:flutter/material.dart';


import '../../../../core/constants/colors.dart';

class Defaultbutton extends StatelessWidget {
  const Defaultbutton({super.key, required this.onPressed, required this.text, required this.icon});
  final Function() onPressed;
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        // Text color
        backgroundColor: defalutColor,
        foregroundColor: Colors.white,

        shadowColor: Colors.blue.withOpacity(0.4),
        elevation: 10, // Shadow depth
      ),
      child: SizedBox(
        width: double.infinity,
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 20), // Icon
              const SizedBox(width: 10),
              Text(
                text,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );

    // return MaterialButton(

    //   onPressed: onPressed,
    //   color: defalutColor,
    //   child: Container(
    //       decoration: BoxDecoration(color: defalutColor),
    //       height: 50,
    //       width: double.infinity,
    //       child: const Center(child: Text("Login"))),
    // );
  }
}
