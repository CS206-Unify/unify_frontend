import 'package:flutter/material.dart';

class EditProfileIcon extends StatefulWidget {
  final String avatarUrl;

  const EditProfileIcon({Key? key, this.avatarUrl = 'BenjaminGan.png'})
      : super(key: key);

  @override
  _EditProfileIconState createState() => _EditProfileIconState();
}

class _EditProfileIconState extends State<EditProfileIcon> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(20.0), // Set the margin around the SizedBox
          child: SizedBox(
            width: 140.0, // Set the width of the image
            height: 140.0, // Set the height of the image
            child: Image.asset(
              'assets/images/avatars/${widget.avatarUrl}',
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: IconButton(
            icon: Icon(Icons.edit, color: Color.fromARGB(255, 174, 114, 241)),
            onPressed: () {
              // Add your edit profile logic here
            },
          ),
        ),
      ],
    );
  }
}
