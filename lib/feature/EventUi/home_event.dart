import 'package:event/feature/EventUi/detail_event.dart';
import 'package:flutter/material.dart';
import 'package:event/core/data/static_data.dart';
import 'package:event/widget/tab_item.dart';
import 'package:event/widget/event_cart.dart';
import 'package:event/widget/upcoming_card.dart';
import 'package:event/feature/EventUi/user_event.dart';

class HomeEvent extends StatefulWidget {
  @override
  State<HomeEvent> createState() => _HomeEventState();
}

class _HomeEventState extends State<HomeEvent>
    with SingleTickerProviderStateMixin {
  int _selectedTab = 0;
  int _selectedFilter = 0;
  int _bottomNav = 0;

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
          // ── Tabs ──
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                TabItem(
                  index: 0,
                  selectedIndex: _selectedTab,
                  icon: Icons.confirmation_number_outlined,
                  label: 'Buy Tickets',
                  onTap: () => setState(() => _selectedTab = 0),
                ),
                TabItem(
                  index: 1,
                  selectedIndex: _selectedTab,
                  icon: Icons.shopping_cart_outlined,
                  label: 'Hire Vendors',
                  onTap: () => setState(() => _selectedTab = 1),
                ),
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

          // ── Popular Events ──
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

          SizedBox(
            height: 36,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: StaticData.filters.length,
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
                      StaticData.filters[i],
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

          SizedBox(
            height: 240,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: StaticData.events.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          DetailEvent(event: StaticData.events[index]),
                    ),
                  ),

                  child: EventCard(
                    event: StaticData.events[index],
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            DetailEvent(event: StaticData.events[index]),
                      ),
                    ),
                  ),
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

          ...StaticData.upcoming
              .map(
                (e) => UpcomingCard(
                  event: e,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => DetailEvent(event: e)),
                  ),
                ),
              )
              .toList(),
        ],
      ),

      // ── Bottom Navigation ──
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNav,
        onTap: (i) {
          setState(() => _bottomNav = i);
          if (i == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => UserEvent()),
            );
          }
        },

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
}
