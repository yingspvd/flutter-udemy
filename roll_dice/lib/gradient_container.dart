import 'package:app/dice_roller.dart';
import 'package:flutter/material.dart';

var startAlignment = Alignment.topLeft;
var endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.color1, this.color2, {super.key});

  const GradientContainer.blue({super.key})
      : color1 = const Color.fromARGB(255, 157, 206, 237),
        color2 = const Color.fromARGB(255, 15, 122, 198);

  final Color color1;
  final Color color2;

 

  @override
  Widget build(context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color1, color2],
              begin: startAlignment,
              end: endAlignment),
        ),
        child: Center(
          child: DiceRoller(),
        ));
  }
}



// class GradientContainer extends StatelessWidget {
//   const GradientContainer({super.key, required this.colors});

//   final List<Color> colors;
//   @override
//   Widget build(context) {
//     return Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//               colors: colors, begin: startAlignment, end: endAlignment),
//         ),
//         child: const Center(child: StyledText("Hello Test!")));
//   }
// }
