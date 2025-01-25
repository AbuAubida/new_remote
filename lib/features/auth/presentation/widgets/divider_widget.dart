import 'package:flutter/material.dart';

class CustomVerticalDivider extends StatelessWidget {
  const CustomVerticalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const VerticalDivider(
      color: Colors.grey,
      endIndent: 10,
      indent: 10,
      thickness: 2,
    );
  }
}

Widget getHorizontalDivider() {
  return Divider(
    color: Colors.grey[400],
    indent: 10,
    endIndent: 10,
    thickness: 1.5,
  );
}
