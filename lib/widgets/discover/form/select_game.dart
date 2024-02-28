import 'package:flutter/material.dart';
import 'package:unify/widgets/discover/form/game_check.dart';

class SelectGame extends StatefulWidget {
  const SelectGame({super.key});

  @override
  State<SelectGame> createState() => _SelectGameState();
}

class _SelectGameState extends State<SelectGame> {
  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: 16,
      direction: Axis.horizontal,
      children: [
        GameCheck(value: "MLBB", imgUrl: "assets/images/logos/MLBB.jpg"),
        GameCheck(value: "BS", imgUrl: "assets/images/logos/BS.png"),
        GameCheck(value: "CODM", imgUrl: "assets/images/logos/CODM.webp")
      ],
    );
  }
}
