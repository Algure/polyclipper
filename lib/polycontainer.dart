library polycontainer;

import 'package:flutter/material.dart';
import 'package:polycontainer/clippers/poly_con_clipper.dart';


class ClipPoly extends StatelessWidget {
  double shift;
  int sides;
  Widget child;

   ClipPoly({required this.sides, this.shift=0, required this.child }){
     assert( sides >=3 );
   }

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: PolyContainerDynamicClipper(sides: sides, startAngle:shift ),
      child: this.child,
    );
  }
}
