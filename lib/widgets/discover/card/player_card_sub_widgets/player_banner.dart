import 'package:flutter/material.dart';

class PlayerBanner extends StatelessWidget {
  const PlayerBanner({super.key, this.imageUrl, required this.name});

  final String? imageUrl;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        SizedBox(
          width: 40,
          height: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: imageUrl == null || imageUrl!.isEmpty
                ? const Image(
                    image: AssetImage("assets/images/avatars/BenjaminGan.png"),
                  )
                : Image.network(imageUrl!),
          ),
        ),
        Text(
          name,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .apply(color: Theme.of(context).colorScheme.primary),
        )
      ],
    );
  }
}
