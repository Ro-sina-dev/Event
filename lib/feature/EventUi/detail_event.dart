import 'package:flutter/material.dart';
import 'package:event/core/data/static_data.dart';
import 'package:event/widget/info_card.dart';
import 'buy_event.dart';

class DetailEvent extends StatelessWidget {
  final Map<String, String> event;
  DetailEvent({required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event['title']!),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Image principale ──
            Image.asset(
              event['image']!,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),

            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── Titre ──
                  Text(
                    event['title']!,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 16),

                  Row(
                    children: [
                      InfoCard(
                        icone: Icons.location_on,
                        label: 'Lieu',
                        valeur: event['lieu'] ?? event['location']!,
                      ),
                      SizedBox(height: 10),
                      InfoCard(
                        icone: Icons.calendar_today,
                        label: 'Date',
                        valeur: event['date']!,
                      ),
                      SizedBox(height: 10),
                      InfoCard(
                        icone: Icons.local_activity,
                        label: 'Prix',
                        valeur: event['price']!,
                        couleurTexte: Colors.orange,
                      ),
                    ],
                  ),

                  SizedBox(height: 24),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BuyEvent(event: event),
                        ),
                      ),
                      child: Text(
                        'Buy Ticket',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),

                  SizedBox(height: 30),

                  // ── Titre autres events ──
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Autres événements',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Voir tout',
                          style: TextStyle(color: Colors.orange),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10),

                  // ── Liste autres events ──
                  ...StaticData.otherEvents.map((autreEvent) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DetailEvent(event: autreEvent),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 6),
                          ],
                        ),
                        child: Row(
                          children: [
                            // Image
                            ClipRRect(
                              borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(16),
                              ),
                              child: Image.asset(
                                autreEvent['image']!,
                                height: 90,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                            ),

                            // Infos
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 10,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      autreEvent['title']!,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          size: 12,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(width: 2),
                                        Text(
                                          autreEvent['lieu']!,
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 11,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 4),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.calendar_today,
                                              size: 12,
                                              color: Colors.grey,
                                            ),
                                            SizedBox(width: 2),
                                            Text(
                                              autreEvent['date']!,
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 11,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          autreEvent['price']!,
                                          style: TextStyle(
                                            color: Colors.orange,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
