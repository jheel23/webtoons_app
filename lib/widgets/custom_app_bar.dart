import 'package:anime_app/widgets/dev_toast.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.theme,
    required this.title,
  });

  final ThemeData theme;
  final String title;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        title,
        style: theme.textTheme.titleLarge!.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: const IconButton(
        onPressed: showDevToast,
        icon: Icon(Iconsax.menu),
      ),
      actions: const [
        IconButton(
          onPressed: showDevToast,
          icon: Icon(Iconsax.search_normal),
        ),
      ],
    );
  }
}
