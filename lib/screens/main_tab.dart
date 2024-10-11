import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class MainTab extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  const MainTab(this.navigationShell, {super.key});

  @override
  State<MainTab> createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> {
  int _currentIndex = 0;

  void changeTab(int index) {
    setState(() {
      _currentIndex = index;
    });
    widget.navigationShell.goBranch(index);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      extendBody: true,
      body: widget.navigationShell,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        margin: const EdgeInsets.all(20),
        height: 80,
        decoration: const BoxDecoration(
          color: Colors.black,
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 20,
              offset: Offset(0, 0),
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () => changeTab(0),
              child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: _currentIndex == 0
                              ? Colors.white.withOpacity(0.2)
                              : Colors.black),
                      child: const Icon(Iconsax.home, color: Colors.white)),
                  const SizedBox(height: 5),
                  Text('Home',
                      style: theme.textTheme.labelMedium!
                          .copyWith(color: Colors.white)),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => changeTab(1),
              child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: _currentIndex == 1
                              ? Colors.white.withOpacity(0.2)
                              : Colors.black),
                      child: const Icon(Iconsax.heart, color: Colors.white)),
                  const SizedBox(height: 5),
                  Text('Favorite',
                      style: theme.textTheme.labelMedium!
                          .copyWith(color: Colors.white)),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => changeTab(2),
              child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: _currentIndex == 2
                              ? Colors.white.withOpacity(0.2)
                              : Colors.black),
                      child: const Icon(Iconsax.star, color: Colors.white)),
                  const SizedBox(height: 5),
                  Text('Rate',
                      style: theme.textTheme.labelMedium!
                          .copyWith(color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
