import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:neersense/analytics.dart';
import 'package:neersense/profile.dart';
import 'package:neersense/quality.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottomNavBar(context),
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Home",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                      Text("Kukatpally", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.star, color: Colors.white, size: 20),
                        SizedBox(width: 4),
                        Text("92/100",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                      child: _buildCard("No Leak", "Updated: 2 min ago",
                          "Show Details >", Icons.water_drop, true)),
                  SizedBox(width: 10),
                  Expanded(
                      child: _buildCard("Monitoring", "Sensor Operational",
                          "Show Details >", Icons.sensors, true)),
                ],
              ),
              SizedBox(height: 10),
              _buildConsumptionCard(context),
              SizedBox(height: 10),
              WaterConservationTips(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(String title, String subtitle, String subtitle2,
      IconData icon, bool isOperational) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Icon(icon, size: 60, color: Colors.blue),
            SizedBox(height: 10),
            Text(title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            SizedBox(height: 5),
            Text(subtitle, style: TextStyle(color: Colors.grey, fontSize: 12)),
            SizedBox(height: 5),
            Align(
              alignment: Alignment.center, // Align to the left
              child: Text(
                subtitle2,
                style: TextStyle(color: Colors.grey, fontSize: 12),
                textAlign: TextAlign.center, // Ensure left alignment
              ),
            ),
            SizedBox(height: 5),
            Icon(Icons.check_circle, color: Colors.green, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildConsumptionCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AnalyticsPage()),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Water consumption",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("1,250 L",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Icon(Icons.show_chart, color: Colors.blue, size: 30),
                ],
              ),
              SizedBox(height: 5),
              Text("Within Normal Range",
                  style: TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildBottomNavBar(BuildContext context) {
  return BottomAppBar(
    shape: CircularNotchedRectangle(),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.local_drink, color: Colors.orange),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WaterQualityScreen()),
              );
            },
          ),
          IconButton(
              icon: Icon(Icons.home, color: Colors.green),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
              }),
          IconButton(
              icon: Icon(Icons.analytics, color: Colors.blue),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AnalyticsPage()),
                );
              }),
          IconButton(
              icon: Icon(Icons.person, color: Colors.purple),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              }),
        ],
      ),
    ),
  );
}

class WaterConservationTips extends StatelessWidget {
  final List<Map<String, String>> tips = [
    {
      "title": "Check the Water Leak",
      "description":
          "Make sure to keep an eye on your water taps for any leaks and repairs",
      "image": "assets/water_leak.png"
    },
    {
      "title": "Harvest Rainwater",
      "description":
          "Collect rainwater to reuse for gardening and other needs.",
      "image": "assets/harvest_rainwater.png"
    },
    {
      "title": "Close The Tap",
      "description": "Turn off the tap while brushing to save water.",
      "image": "assets/close_tap.png"
    },
    {
      "title": "Using Watering Can",
      "description":
          "Use a watering can instead of a hose to water plants efficiently.",
      "image": "assets/watering_can.png"
    },
    {
      "title": "Shower Instead Bath",
      "description":
          "Take quick showers instead of long baths to conserve water.",
      "image": "assets/shower.png"
    },
    {
      "title": "Save Water Faucet",
      "description": "Fix leaky faucets to prevent water wastage.",
      "image": "assets/save_faucet.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "Personalized Recommendations",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 10),
        CarouselSlider(
          options: CarouselOptions(
            height: 280, // Adjust height to fit design
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 1,
          ),
          items: tips.map((tip) {
            return _buildTipCard(tip);
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildTipCard(Map<String, String> tip) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(tip["image"]!, height: 130),
            SizedBox(height: 5),
            Text(tip["title"]!,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text(
              tip["description"]!,
              style: TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
