import 'package:flutter/material.dart';
import 'package:event/widget/menuitem_card.dart';
import 'package:event/widget/stat_card.dart';

class UserEvent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Mon Profil',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ── Header profil ──
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  // Avatar
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.orange.shade100,
                    child: Icon(Icons.person, size: 50, color: Colors.orange),
                  ),

                  SizedBox(height: 12),

                  Text(
                    'Utilisateur',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 4),

                  Text(
                    'utilisateur@email.com',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),

                  SizedBox(height: 16),

                  // Stats
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      StatCard(nombre: '12', label: 'Events'),
                      Container(
                        width: 1,
                        height: 40,
                        color: Colors.grey.shade300,
                      ),
                      StatCard(nombre: '5', label: 'Tickets'),
                      Container(
                        width: 1,
                        height: 40,
                        color: Colors.grey.shade300,
                      ),
                      StatCard(nombre: '3', label: 'Favoris'),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 12),

            // ── Menu options ──
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  MenuitemCard(
                    icon: Icons.confirmation_number_outlined,
                    label: 'Mes Tickets',
                    onTap: () {},
                  ),
                  MenuitemCard(
                    icon: Icons.favorite_border,
                    label: 'Mes Favoris',
                    onTap: () {},
                  ),

                  MenuitemCard(
                    icon: Icons.location_on_outlined,
                    label: 'Mon Adresse',
                    onTap: () {},
                  ),
                  MenuitemCard(
                    icon: Icons.notifications_none,
                    label: 'Notifications',
                    onTap: () {},
                  ),
                  MenuitemCard(
                    icon: Icons.settings_outlined,
                    label: 'Paramètres',
                    onTap: () {},
                  ),
                  MenuitemCard(
                    icon: Icons.help_outline,
                    label: 'Aide',
                    onTap: () {},
                  ),
                ],
              ),
            ),

            SizedBox(height: 12),

            // ── Bouton déconnexion ──
            Container(
              color: Colors.white,
              child: MenuitemCard(
                icon: Icons.logout,
                label: 'Déconnexion',

                onTap: () {},

                couleur: Colors.red,
              ),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
