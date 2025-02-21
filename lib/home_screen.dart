import 'package:cng_users/filling_station_booking.dart';
import 'package:cng_users/filling_station_details.dart';
import 'package:cng_users/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: TabBarView(
          controller: _tabController,
          children: [
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      labelText: 'Search',
                    ),
                  ),
                ),
              ],
            ),
            Container(
              color: Colors.red,
              child: FillingStationDetails(),
            ),
            Container(color: Colors.green),
            ProfileScreen()
          ],
        ),
        bottomNavigationBar: Material(
          color: Color(0xFF00A36C),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BottomNavbarItem(
                  isActive: _tabController.index == 0,
                  label: 'Search',
                  iconData: Icons.location_on_outlined,
                  onTap: () {
                    _tabController.animateTo(0);
                  },
                ),
                BottomNavbarItem(
                  isActive: _tabController.index == 1,
                  label: 'Favorite',
                  iconData: Icons.favorite_border,
                  onTap: () {
                    _tabController.animateTo(1);
                  },
                ),
                BottomNavbarItem(
                  isActive: _tabController.index == 2,
                  label: 'Route',
                  iconData: Icons.add_road,
                  onTap: () {
                    _tabController.animateTo(2);
                  },
                ),
                BottomNavbarItem(
                  isActive: _tabController.index == 3,
                  label: 'Profile',
                  iconData: Icons.account_circle_outlined,
                  onTap: () {
                    _tabController.animateTo(3);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfilePageButton extends StatelessWidget {
  final Function() onTap;
  final IconData iconData;
  final String options;
  const ProfilePageButton({
    super.key,
    required this.iconData,
    required this.options,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(iconData),
          SizedBox(
            width: 20,
          ),
          Text(
            options,
            style: TextStyle(fontSize: 20),
          ),
          Spacer(),
          Icon(Icons.navigate_next_rounded)
        ],
      ),
    );
  }
}

class BottomNavbarItem extends StatelessWidget {
  final String label;
  final IconData iconData;
  final Function() onTap;
  final bool isActive;
  const BottomNavbarItem({
    super.key,
    required this.label,
    required this.iconData,
    required this.onTap,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            size: 30,
            color: isActive ? Colors.black : Colors.white,
          ),
          Text(
            label,
            style: TextStyle(color: isActive ? Colors.black : Colors.white),
          ),
        ],
      ),
    );
  }
}
