import 'package:flutter/material.dart';

class MenuitemCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  final Color? couleur;

  const MenuitemCard({
    this.couleur,

    required this.icon,

    required this.label,

    required this.onTap,

    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Icon(icon, color: couleur ?? Colors.orange, size: 22),
            SizedBox(width: 14),
            Expanded(
              child: Text(
                label,
                style: TextStyle(fontSize: 15, color: couleur ?? Colors.black),
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.grey, size: 20),
          ],
        ),
      ),
    );
  }
}
