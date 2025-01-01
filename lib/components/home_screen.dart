import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  int _selectedIndex = 0; // To track the selected bottom navigation index

  // List of deliveries (mock data)
  List<String> deliveries = [
    "Order #1234 - Delivered",
    "Order #1235 - In Transit",
    "Order #1236 - Pending",
    "Order #1237 - Delivered",
    "Order #1238 - In Transit",
    "Order #1239 - Delivered",
    "Order #1240 - Pending",
    "Order #1241 - Delivered",
    "Order #1242 - In Transit",
    "Order #1243 - Delivered",
  ];

  // List to hold the filtered deliveries
  late List<String> filteredDeliveries;

  @override
  void initState() {
    super.initState();
    // Initialize filteredDeliveries with the same list as deliveries
    filteredDeliveries = List.from(deliveries);
  }

  // Method to filter the deliveries based on search input
  void _filterDeliveries() {
    setState(() {
      filteredDeliveries = deliveries
          .where((delivery) => delivery
              .toLowerCase()
              .contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  // Method to handle bottom navigation item taps
  void _onBottomNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (_selectedIndex) {
      case 0:
        print("Home tapped");
        break;
      case 1:
        print("Orders tapped");
        break;
      case 2:
        print("Nearby tapped");
        break;
      case 3:
        print("Profile tapped");
        break;
    }
  }

  // Get an icon based on the delivery status
  Icon _getDeliveryIcon(String delivery) {
    if (delivery.contains('Delivered')) {
      return const Icon(Icons.check_circle, color: Colors.green); // Delivered
    } else if (delivery.contains('In Transit')) {
      return const Icon(Icons.local_shipping, color: Colors.blue); // In Transit
    } else if (delivery.contains('Pending')) {
      return const Icon(Icons.access_time, color: Colors.orange); // Pending
    } else {
      return const Icon(Icons.error, color: Colors.red); // Error/Unknown
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Check Deliveries'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Profile section
              _buildProfileSection(),

              // Cards for Order, Nearby, Help Center
              _buildCardsSection(),

              // Search Bar
              _buildSearchBar(),

              // Recent Deliveries Section
              _buildRecentDeliveriesSection(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  // Profile section widget
  Widget _buildProfileSection() {
    return const Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Color(0xFFFFA016),
          child: Text(
            'DK', // Hardcoded for now
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        SizedBox(width: 16),
      ],
    );
  }

  // Cards section widget
  Widget _buildCardsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildCard('Order', Icons.shopping_cart),
          _buildCard('Nearby', Icons.location_on),
          _buildCard('Help Center', Icons.help),
        ],
      ),
    );
  }

  // A single card widget with an icon and title
  Widget _buildCard(String title, IconData icon) {
    return GestureDetector(
      onTap: () {
        // Handle card tap (For now just print)
        print('Tapped on $title');
        // You could also navigate to another screen here or show an action
      },
      child: Card(
        color: const Color(0xFFFFA016),
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          width: 110,
          height: 100,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.white),
              const SizedBox(height: 8),
              Text(title,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }

  // Search bar widget
  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          labelText: 'Search Deliveries',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          suffixIcon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: _filterDeliveries,
          ),
        ),
        onChanged: (query) {
          _filterDeliveries();
        },
      ),
    );
  }

  // Recent deliveries section widget
  Widget _buildRecentDeliveriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recent Deliveries',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount:
              filteredDeliveries.length > 10 ? 10 : filteredDeliveries.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: _getDeliveryIcon(
                  filteredDeliveries[index]), // Delivery type icon
              title: Text(filteredDeliveries[index]),
              onTap: () {
                print('Tapped on ${filteredDeliveries[index]}');
              },
            );
          },
        ),
      ],
    );
  }

  // Bottom navigation bar widget
  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      unselectedIconTheme: const IconThemeData(color: Colors.black),
      selectedIconTheme: const IconThemeData(color: Colors.grey),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_shipping),
          label: 'Orders',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.location_on),
          label: 'Nearby',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      onTap: _onBottomNavTapped,
    );
  }
}
