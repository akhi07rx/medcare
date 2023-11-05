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
          icon: Icon(Iconsax.home),
          title: Text(""),
          selectedColor: Colors.purple,
        ),
        SalomonBottomBarItem(
          icon: Icon(Iconsax.save_2),
          title: Text(""),
          selectedColor: Colors.pink,
        ),
        SalomonBottomBarItem(
          icon: Icon(Iconsax.activity),
          title: Text(""),
          selectedColor: Colors.orange,
        ),
        SalomonBottomBarItem(
          icon: Icon(Iconsax.user),
          title: Text(""),
          selectedColor: Colors.teal,
        ),
      ],
    );
  }
}
