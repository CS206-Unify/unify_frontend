import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RoutingButton extends StatelessWidget {
  const RoutingButton({super.key, required this.text, required this.location});
  final String text;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: FilledButton.tonal(
            onPressed: () {
              context.go(location);
            },
            child: Text(text)));
  }
}
