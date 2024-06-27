import 'package:assesment_task/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({
    Key? key,
    this.selectedColor = Colors.white,
    this.unselectedColor = Colors.white,
    required this.onTap,
    this.chatCount = 0,
  }) : super(key: key);
  final Color selectedColor;
  final Color unselectedColor;
  final Function(int) onTap;
  final int chatCount;
  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      constraints: const BoxConstraints(minHeight: 70),
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInCirc,
      margin: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(150),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff000000).withOpacity(0.25),
            spreadRadius: 1.5,
            blurRadius: 8,
            offset: const Offset(0, 1),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BottomNavigationItem(
            backgroundColor: Colors.transparent,
            icon: Icons.search_rounded,
            color: selectedIndex == 0 ? Colors.white : widget.unselectedColor,
            isSelected: selectedIndex == 0,
            onTap: () {
              setState(() {
                selectedIndex = 0;
              });
              widget.onTap(selectedIndex);
            },
          ),
          BottomNavigationItem(
            backgroundColor: Colors.transparent,
            icon: Icons.chat_bubble_rounded,
            color: selectedIndex == 1 ? Colors.white : widget.unselectedColor,
            isSelected: selectedIndex == 1,
            onTap: () {
              setState(() {
                selectedIndex = 1;
              });
              widget.onTap(selectedIndex);
            },
          ),
          BottomNavigationItem(
            backgroundColor: Colors.transparent,
            icon: Icons.home,
            showIcon: selectedIndex == 1 ? false : true,
            color: selectedIndex == 2 ? Colors.white : widget.unselectedColor,
            isSelected: selectedIndex == 2,
            onTap: () {
              setState(() {
                selectedIndex = 2;
              });
              widget.onTap(selectedIndex);
            },
          ),
          BottomNavigationItem(
            badgeCount: widget.chatCount,
            backgroundColor: Colors.transparent,
            icon: Icons.heart_broken,
            color: selectedIndex == 3 ? Colors.white : widget.unselectedColor,
            isSelected: selectedIndex == 3,
            onTap: () {
              setState(() {
                selectedIndex = 3;
              });
              widget.onTap(selectedIndex);
            },
          ),
          BottomNavigationItem(
            backgroundColor: Colors.transparent,
            icon: Icons.account_circle_rounded,
            color: selectedIndex == 4 ? Colors.white : widget.unselectedColor,
            isSelected: selectedIndex == 4,
            onTap: () {
              setState(() {
                selectedIndex = 4;
              });
              widget.onTap(selectedIndex);
            },
          ),
        ],
      ),
    );
  }
}

class BottomNavigationItem extends StatelessWidget {
  const BottomNavigationItem({
    Key? key,
    required this.backgroundColor,
    required this.icon,
    required this.isSelected,
    required this.color,
    required this.onTap,
    this.badgeCount = 0,
    this.showGradient = false,
    this.showIcon = true,
  }) : super(key: key);
  final bool showIcon;
  final IconData icon;
  final int badgeCount;
  final bool isSelected;
  final Color backgroundColor;
  final Color color;
  final bool showGradient;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedContainer(
        padding: EdgeInsets.all(isSelected ? 16 : 8),
        duration: const Duration(milliseconds: 250),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.secondaryColor : Colors.grey.shade600,
          shape: BoxShape.circle,
        ),
        curve: Curves.easeInBack,
        child: GestureDetector(
          onTap: onTap,
          child: Icon(
            icon,
            size: 25,
            color: color,
          ),
        ),
      ),
    );
  }
}
