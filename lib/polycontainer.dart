library polycontainer;

import 'package:flutter/material.dart';


class ClipPoly extends StatelessWidget {
  double shift;
  int sides;
  Widget child;
   ClipPoly({required this.sides, required this.shift, required this.child });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ,
      child: this.child,
    );
  }
}
