import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final String nombre;
  final String label;
  const StatCard({required this.label, required this.nombre, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          nombre,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(label, style: TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }
}
