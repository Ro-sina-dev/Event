import 'package:flutter/material.dart';

void main() {
  runApp(MyAppEvent());
}

class MyAppEvent extends StatelessWidget {
  MyAppEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Eventcard());
  }
}

class Eventcard extends StatefulWidget {
  const Eventcard({super.key});

  @override
  State<Eventcard> createState() => _EventcardState();
}

class _EventcardState extends State<Eventcard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event'),
        centerTitle: false,

        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add_alert))],
      ),
      body: ListView(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(12),
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.search),
                    label: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Recherche event...',
                          style: TextStyle(
                            color: const Color.fromARGB(221, 78, 77, 77),
                          ),
                        ),
                      ],
                    ),

                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(
                          color: const Color.fromARGB(255, 119, 118, 118),
                          width: 0.5,
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(12),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Popular Event'),
                      TextButton(onPressed: () {}, child: Text('Voir plus')),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          height: 200, // Hauteur totale du conteneur
                          width: 300,

                          child: Column(
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(12),
                                  ),
                                  child: Image.asset(
                                    'assets/images/event1.jpg',
                                    fit: BoxFit.cover,
                                    width: 190,
                                  ),
                                ),
                              ),

                              Container(
                                padding: EdgeInsets.all(12),
                                color: Colors.amberAccent,
                                child: Text('10000 CFA'),
                                width: 190,
                              ),
                            ],
                          ),
                        ),

                        Container(
                          height: 200,
                          width: 300,
                          child: Column(
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(12),
                                  ),
                                  child: Image.asset(
                                    'assets/images/event1.jpg',
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                ),
                              ),

                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(10),
                                color: Colors.amberAccent,
                                child: Text('10000 CFA'),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(width: 20),
                        Container(
                          height: 190,
                          width: 200,
                          decoration: BoxDecoration(color: Colors.amberAccent),
                        ),
                        SizedBox(width: 20),
                        Container(
                          height: 190,
                          width: 200,
                          decoration: BoxDecoration(color: Colors.amberAccent),
                        ),

                        SizedBox(width: 20),
                        Container(
                          height: 190,
                          width: 200,
                          decoration: BoxDecoration(color: Colors.amberAccent),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Recherche'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
