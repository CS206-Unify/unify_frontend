import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unify/widgets/common/nav/bottom_navigation_bar.dart';
import 'package:unify/widgets/common/nav/top_app_bar.dart';

class BrawlStarsProfilePage extends StatefulWidget {
  const BrawlStarsProfilePage({super.key, this.title, this.game, this.profileImg});
  final String? title;
  final String? game;
  final String? profileImg;

  @override
  State<BrawlStarsProfilePage> createState() => _BrawlStarsProfilePageState();

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

class _BrawlStarsProfilePageState extends State<BrawlStarsProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
      title: Text(
        widget.title ?? "Brawl Stars Profile",
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
                              : "assets/images/logos/BS.png")))),
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
      ),
      body: const Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Text("This is Brawl Stars Profile Page")],
      )),
    );
  }
}
