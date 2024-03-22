import 'package:flutter/material.dart';

class ImageUploadForm extends StatelessWidget {
  const ImageUploadForm({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 70.0,
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      child: Icon(
        const IconData(0xe130, fontFamily: 'MaterialIcons'),
        color: Theme.of(context).colorScheme.secondary,
        size: 40.0,
      ),
    );
  }
}
