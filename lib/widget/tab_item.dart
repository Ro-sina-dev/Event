import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  final int index;
  final int selectedIndex;
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const TabItem({
    required this.index,
    required this.selectedIndex,
    required this.icon,
    required this.label,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool selected = selectedIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: selected ? Colors.orange : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 18,
                color: selected ? Colors.orange : Colors.grey,
              ),
              SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  color: selected ? Colors.orange : Colors.grey,
                  fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
