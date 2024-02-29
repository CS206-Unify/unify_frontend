import 'package:flutter/material.dart';

class FilterDialogAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const FilterDialogAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.close_outlined)),
      title: Text(
        "Filters",
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: Theme.of(context).colorScheme.onSurface),
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Save"))
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
