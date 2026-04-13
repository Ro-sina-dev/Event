import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final IconData icone;
  final String label;
  final Color? couleurTexte;
  final String valeur;

  const InfoCard({
    required this.icone,
    required this.label,
    this.couleurTexte,
    required this.valeur,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.orange.shade50,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icone, color: Colors.orange, size: 14),
                SizedBox(width: 4),
                Text(label, style: TextStyle(color: Colors.grey, fontSize: 11)),
              ],
            ),

            SizedBox(height: 4),

            Text(
              valeur,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: couleurTexte ?? Colors.black,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
