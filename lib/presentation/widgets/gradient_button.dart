import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({Key? key, required this.onTap, required this.title})
      : super(key: key);

  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: width,
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [Colors.orange, Colors.red]),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.orange.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: title.text.xl2.white.makeCentered(),
      ).pSymmetric(h: 15),
    );
  }
}
