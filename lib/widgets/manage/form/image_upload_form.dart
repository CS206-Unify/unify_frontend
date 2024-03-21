import 'package:flutter/material.dart';

class ImageUploadForm extends StatelessWidget {
  const ImageUploadForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: <Widget>[
        Positioned(
          bottom: 10,
          right: 130,
          child: Icon(
            const IconData(0xef8d, fontFamily: 'MaterialIcons'),
            color: Theme.of(context).colorScheme.secondary,
            size: 30.0,
          ),
        ),
      ],
    );
  }
}
