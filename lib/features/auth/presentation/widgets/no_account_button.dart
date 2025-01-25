import 'package:flutter/material.dart';

class NoAccountButton extends StatelessWidget {
  final bool isLogin;
  final VoidCallback onPressed;
  const NoAccountButton(
      {super.key, required this.isLogin, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      textBaseline: TextBaseline.alphabetic,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("${isLogin ? "Don't" : ""} have an account !",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.purpleAccent)),
        const SizedBox(
          width: 5,
        ),
        InkWell(
          hoverColor: Colors.green,
          onTap: onPressed,
          child: Text(
            isLogin ? "Sign UP" : " Log In",
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor),
          ),
        ),
      ],
    );
  }
}
