import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:iconsax/iconsax.dart';

class BottomNavBar extends StatefulWidget {
  final Function(int) onTap;
  final int currentIndex;

  BottomNavBar({required this.onTap, required this.currentIndex});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
      currentIndex: widget.currentIndex,
      onTap: widget.onTap,
      items: [
        SalomonBottomBarItem(
          icon: const Icon(Iconsax.home),
          title: const Text("HOME"),
          selectedColor: Colors.purple,
        ),
        SalomonBottomBarItem(
          icon: const Icon(Iconsax.save_2),
          title: const Text("APPOINTMENTS"),
          selectedColor: Colors.pink,
        ),
        SalomonBottomBarItem(
          icon: const Icon(Iconsax.note_1),
          title: const Text("REPORTS"),
          selectedColor: Colors.orange,
        ),
        SalomonBottomBarItem(
          icon: const Icon(Iconsax.user),
          title: const Text("PROFILE"),
          selectedColor: Colors.teal,
        ),
      ],
    );
  }
}
