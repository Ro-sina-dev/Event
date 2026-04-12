import 'package:event/feature/EventUi/detail_event.dart';
import 'package:flutter/material.dart';

class HomeEvent extends StatefulWidget {
  @override
  State<HomeEvent> createState() => _HomeEventState();
}

class _HomeEventState extends State<HomeEvent>
    with SingleTickerProviderStateMixin {
  int _selectedTab = 0; // 0 = Buy Tickets, 1 = Hire Vendors
  int _selectedFilter = 0;
  int _bottomNav = 0;

  final List<String> filters = ['All', 'Music', 'Food', 'Dating', 'Business'];

  final List<Map<String, String>> events = [
    {
      'title': 'Burna Boy Live',
      'image': 'assets/images/event1.jpg',
      'price': '\$32',
      'location': 'Eko Hotel',
      'date': 'Aug 25',
    },
    {
      'title': 'Wizkid Live in MSG',
      'image': 'assets/images/event1.jpg',
      'price': '\$32',
      'location': 'New York',
      'date': 'Aug 25',
    },
    {
      'title': 'Afrobeats Night',
      'image': 'assets/images/event1.jpg',
      'price': '\$20',
      'location': 'Lagos',
      'date': 'Sep 10',
    },
  ];

  final List<Map<String, String>> upcoming = [
    {
      'title': 'Jazz Festival',
      'image': 'assets/images/event1.jpg',
      'price': '\$15',
      'location': 'Abidjan',
      'date': 'Oct 5',
    },
    {
      'title': 'Food & Fun',
      'image': 'assets/images/event1.jpg',
      'price': '\$10',
      'location': 'Plateau',
      'date': 'Oct 12',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Icon(Icons.local_activity, color: Colors.orange, size: 22),
            SizedBox(width: 6),
            Text(
              'event',
              style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),

      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // ── Tabs Buy Tickets / Hire Vendors ──
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                _buildTab(0, Icons.confirmation_number_outlined, 'Buy Tickets'),
                _buildTab(1, Icons.shopping_cart_outlined, 'Hire Vendors'),
              ],
            ),
          ),

          SizedBox(height: 16),

          // ── Search Bar ──
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.search, color: Colors.grey),
                hintText: _selectedTab == 0
                    ? 'Search for events...'
                    : 'Search for vendors...',
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),

          SizedBox(height: 20),

          // ── Popular Events Header ──
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _selectedTab == 0 ? 'Popular Events' : 'Top Vendors for You',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              TextButton(
                onPressed: () {},
                child: Text('See all', style: TextStyle(color: Colors.orange)),
              ),
            ],
          ),

          // ── Filtres ──
          SizedBox(
            height: 36,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (context, i) {
                bool selected = _selectedFilter == i;
                return GestureDetector(
                  onTap: () => setState(() => _selectedFilter = i),
                  child: Container(
                    margin: EdgeInsets.only(right: 8),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      color: selected ? Colors.orange : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: selected ? Colors.orange : Colors.grey.shade300,
                      ),
                    ),
                    child: Text(
                      filters[i],
                      style: TextStyle(
                        color: selected ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          SizedBox(height: 16),

          // ── Cards Horizontales ──
          SizedBox(
            height: 240,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: events.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailEvent(event: events[index]),
                    ),
                  ),
                  child: _buildEventCard(events[index]),
                );
              },
            ),
          ),

          SizedBox(height: 24),

          // ── Upcoming Events ──
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Upcoming Events',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              TextButton(
                onPressed: () {},
                child: Text('See all', style: TextStyle(color: Colors.orange)),
              ),
            ],
          ),

          SizedBox(height: 10),

          // ── Cards Upcoming (vertical) ──
          ...upcoming.map((e) => _buildUpcomingCard(e)).toList(),
        ],
      ),

      // ── Bottom Navigation ──
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNav,
        onTap: (i) => setState(() => _bottomNav = i),
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Events'),
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront),
            label: 'Vendors',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'User'),
        ],
      ),
    );
  }

  // ── Widget Tab ──
  Widget _buildTab(int index, IconData icon, String label) {
    bool selected = _selectedTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedTab = index),
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

  // ── Card Event Horizontale ──
  Widget _buildEventCard(Map<String, String> event) {
    return Container(
      width: 180,
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.asset(
                  event['image']!,
                  height: 130,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              // Bouton favori
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event['title']!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    Icon(Icons.location_on, size: 12, color: Colors.grey),
                    SizedBox(width: 2),
                    Text(
                      event['location']!,
                      style: TextStyle(color: Colors.grey, fontSize: 11),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          event['date']!,
                          style: TextStyle(color: Colors.grey, fontSize: 11),
                        ),
                      ],
                    ),
                    Text(
                      event['price']!,
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
        ],
      ),
    );
  }

  // ── Card Upcoming (horizontale large) ──
  Widget _buildUpcomingCard(Map<String, String> event) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => DetailEvent(event: event)),
      ),
      child: Container(
        margin: EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.horizontal(left: Radius.circular(16)),
              child: Image.asset(
                event['image']!,
                height: 90,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event['title']!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 13, color: Colors.grey),
                        SizedBox(width: 2),
                        Text(
                          event['location']!,
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_today,
                              size: 13,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 2),
                            Text(
                              event['date']!,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          event['price']!,
                          style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(Icons.favorite_border, color: Colors.red, size: 18),
            ),
          ],
        ),
      ),
    );
  }
}
