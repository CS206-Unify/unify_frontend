import 'package:flutter/material.dart';

class FilterDropdownMenu extends StatelessWidget {
  const FilterDropdownMenu(
      {super.key,
      required this.choices,
      required this.label,
      required this.onSelected});

  final List<DropdownMenuEntry> choices;
  final String label;
  final void Function(dynamic) onSelected;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      initialSelection: choices[0].value,
        width: MediaQuery.of(context).size.width - 48,
        label: Text(label),
        inputDecorationTheme: const InputDecorationTheme(
            filled: true, constraints: BoxConstraints.expand()),
        onSelected: onSelected,
        dropdownMenuEntries: choices);
  }
}
