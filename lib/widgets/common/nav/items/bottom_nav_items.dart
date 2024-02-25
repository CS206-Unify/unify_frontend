import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavItems extends StatelessWidget {
  const BottomNavItems({super.key, required this.page, required this.isActive});
  final String page;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {context.go("/${page.toLowerCase()}")},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 70,
            height: 4,
            color: isActive == true
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.surface,
          ),
          Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    page == "Home"
                        ? Icons.home_outlined
                        : page == "Discover"
                            ? Icons.search_outlined
                            : page == "Chats"
                                ? Icons.message_outlined
                                : Icons.manage_accounts_outlined,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  Text(
                    page,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.apply(color: Theme.of(context).colorScheme.primary),
                  )
                ]),
          )
        ],
      ),
    );
  }
}
