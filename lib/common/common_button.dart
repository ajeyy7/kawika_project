import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final void Function() onTap;
  final String label;
  const CommonButton({super.key, required this.onTap, required this.label});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(4)),
        child: Center(
            child: Text(
          label,
          style: const TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}
