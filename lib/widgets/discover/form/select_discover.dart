import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unify/model/discover/discover_model.dart';
import 'package:unify/router.dart';

class SelectDiscover extends StatelessWidget {
  const SelectDiscover({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DiscoverModel>(
        builder: (context, formValues, child) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () => {
                    if (formValues.getGame.isNotEmpty &&
                        formValues.getGame != "")
                      {router.go("/players")}
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person_outline_outlined,
                        color: formValues.getGame.isEmpty ||
                                formValues.getGame == ""
                            ? Theme.of(context).colorScheme.onPrimary
                            : Theme.of(context).colorScheme.primary,
                        size: 64,
                      ),
                      Text(
                        "Players",
                        style: Theme.of(context).textTheme.labelSmall!.apply(
                              color: formValues.getGame.isEmpty ||
                                      formValues.getGame == ""
                                  ? Theme.of(context).colorScheme.onPrimary
                                  : Theme.of(context).colorScheme.primary,
                            ),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => {
                    if (formValues.getGame.isNotEmpty &&
                        formValues.getGame != "")
                      {router.go("/teams")}
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.people_outline_outlined,
                        color: formValues.getGame.isEmpty ||
                                formValues.getGame == ""
                            ? Theme.of(context).colorScheme.onPrimary
                            : Theme.of(context).colorScheme.primary,
                        size: 64,
                      ),
                      Text(
                        "Teams",
                        style: Theme.of(context).textTheme.labelSmall!.apply(
                              color: formValues.getGame.isEmpty ||
                                      formValues.getGame == ""
                                  ? Theme.of(context).colorScheme.onPrimary
                                  : Theme.of(context).colorScheme.primary,
                            ),
                      )
                    ],
                  ),
                )
              ],
            ));
  }
}
