import 'package:flutter/material.dart';

class TeamBanner extends StatelessWidget {
  const TeamBanner(
      {super.key,
      this.imageUrl,
      required this.teamName,
      required this.maximumTeamSize,
      required this.currentTeamSize});

  final String? imageUrl;
  final String teamName;
  final int maximumTeamSize;
  final int currentTeamSize;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        SizedBox(
          width: 35,
          height: 35,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: imageUrl == null || imageUrl!.isEmpty
                ? const Image(
                    image: AssetImage("assets/images/logos/Unify.png"),
                  )
                : Image.network(imageUrl!),
          ),
        ),
        Container(
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                teamName,
                style: Theme.of(context).textTheme.titleSmall!.apply(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              SizedBox(height: 4), // Add spacing between the text and the icon
              Row(
                children: [
                  Icon(
                    Icons.group, // Choose the icon that matches your design
                    color: Theme.of(context).colorScheme.secondaryContainer,
                  ),
                  SizedBox(
                      width: 4), // Add spacing between the icon and the numbers
                  Text(
                    '$currentTeamSize/$maximumTeamSize',
                    style: Theme.of(context).textTheme.bodySmall!.apply(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
