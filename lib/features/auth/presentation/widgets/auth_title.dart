import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';

class AuthTitle extends StatelessWidget {
  final String title;

  const AuthTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(fontWeight: FontWeight.bold, color: defalutColor),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Hey!! ${title == "Login" ? "Login" : "Register"} to enjoy with our chat App !!",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
