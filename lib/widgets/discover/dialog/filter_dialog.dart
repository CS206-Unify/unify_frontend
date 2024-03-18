import 'package:flutter/material.dart';
import 'package:unify/widgets/discover/appbar/filter_dialog_appbar.dart';
import 'package:unify/widgets/discover/form/filters_form.dart';

class FilterDialog extends StatefulWidget {
  const FilterDialog({super.key});

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      child: Scaffold(
        appBar: const FilterDialogAppBar(),
        body: Container(
          margin: const EdgeInsets.fromLTRB(24, 12, 24, 0),
          child: const FiltersForm(),
        ),
      ),
    );
  }
}
