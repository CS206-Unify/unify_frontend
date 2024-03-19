import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unify/model/discover/discover_model.dart';

class GameCheck extends StatelessWidget {
  const GameCheck({super.key, required this.value, required this.imgUrl});
  final String value;
  final String imgUrl;


  @override
  Widget build(BuildContext context) {
   
    return Consumer<DiscoverModel>(
        builder: (context, formValues, child) => InkWell(
              onTap: () {
                formValues.setGame(value);
              },
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    border: formValues.getGame == value
                        ? Border.all(color: Colors.green)
                        : null,
                    borderRadius: BorderRadius.circular(8)),
                child: Stack(
                  alignment: const Alignment(1, 1),
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image(image: AssetImage(imgUrl)),
                    ),
                    Icon(
                      Icons.check,
                      color: formValues.getGame == value
                          ? Colors.green
                          : const Color.fromRGBO(0, 0, 0, 0),
                    )
                  ],
                ),
              ),
            ));
  }
}
