import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TopAppBar extends StatefulWidget implements PreferredSizeWidget {
  const TopAppBar({super.key, this.title, this.game, this.profileImg});
  final String? title;
  final String? game;
  final String? profileImg;

  @override
  State<TopAppBar> createState() => _TopAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

class _TopAppBarState extends State<TopAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.surface,
      title: Text(
        widget.title ?? "Unify",
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      leading: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(100.0),
              border: Border.all(
                  color: Theme.of(context).colorScheme.onPrimary, width: 1.0)),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: Image(
                  image: AssetImage(widget.game == "bs"
                      ? "assets/images/logos/BS.png"
                      : widget.game == "mlbb"
                          ? "assets/images/logos/MLBB.jpg"
                          : widget.game == "codm"
                              ? "assets/images/logos/CODM.webp"
                              : "assets/images/logos/Unify.png")))),
      actions: [
        InkWell(
            onTap: () => context.go('/profile'),
            child: Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: widget.profileImg != null
                    ? Image.network(widget.profileImg!)
                    : const Image(
                        image: AssetImage("assets/images/logos/CODM.webp")),
              ),
            ))
      ],
    );
  }
}
