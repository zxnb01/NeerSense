import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:carousel_slider/carousel_slider.dart';

class WaterQualityScreen extends StatelessWidget {
  final double waterQualityScore = 75.0;
  final List<Map<String, String>> articles = [
    {"title": "Water is Hard?", "subtitle": "Install a Filter"},
    {"title": "High Chlorine Detected", "subtitle": "Check Municipal Supply"},
    {"title": "Improve Water Quality", "subtitle": "Follow These Tips"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Water Quality Monitoring")),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildQualityScoreCard(),
              SizedBox(height: 20),
              _buildQualityBreakdown(),
              SizedBox(height: 20),
              _buildArticleCarousel(),
              SizedBox(height: 20),
              _buildActionButtons(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQualityScoreCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text("Water Quality Score",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            SizedBox(
              height: 150,
              child: SfRadialGauge(
                axes: [
                  RadialAxis(
                    startAngle: 180,
                    endAngle: 0,
                    minimum: 0,
                    maximum: 100,
                    showLabels: false,
                    showTicks: false,
                    ranges: [
                      GaugeRange(
                          startValue: 0, endValue: 40, color: Colors.red),
                      GaugeRange(
                          startValue: 40, endValue: 70, color: Colors.orange),
                      GaugeRange(
                          startValue: 70, endValue: 100, color: Colors.green),
                    ],
                    pointers: [
                      NeedlePointer(value: waterQualityScore)
                    ], // Dynamic value
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQualityBreakdown() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Breakdown of Water Quality",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            _buildBreakdownItem("TDS", "300 ppm", Colors.blue),
            _buildBreakdownItem("pH Level", "7.2", Colors.green),
            _buildBreakdownItem("Turbidity", "2 NTU", Colors.orange),
          ],
        ),
      ),
    );
  }

  Widget _buildBreakdownItem(String title, String value, Color color) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 16)),
          Text(value,
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }

  Widget _buildArticleCarousel() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 140,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 1.0, // Adjust item size
      ),
      items: articles.map((article) {
        return Container(
          width: double.infinity, // Makes sure the item takes full width
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(article["title"]!,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(article["subtitle"]!,
                      style: TextStyle(fontSize: 14, color: Colors.grey)),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  // Widget _buildActionButtons(BuildContext context) {
  //   return SingleChildScrollView( // Enables horizontal scrolling
  //     child: ListView(
  //     scrollDirection: Axis.horizontal,
  //       children: [
  //         _buildActionButton(
  //           context,
  //           icon: Icons.science,
  //           label: "Request Test",
  //           message: "Requesting Water Test...",
  //         ),
  //         _buildActionButton(
  //           context,
  //           icon: Icons.phone,
  //           label: "Call Plumber",
  //           message: "Calling Plumber...",
  //         ),
  //         _buildActionButton(
  //           context,
  //           icon: Icons.shopping_cart,
  //           label: "Buy Products",
  //           message: "Opening Store...",
  //         ),
  //         // Add more buttons here if needed
  //       ],
  //     ),
  //   );
  // }
  Widget _buildActionButtons(BuildContext context) {
    return Container(
      height: 50, // Ensures a fixed height for proper scrolling
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildActionButton(
            context,
            icon: Icons.science,
            label: "Request Test",
            message: "Requesting Water Test...",
          ),
          _buildActionButton(
            context,
            icon: Icons.phone,
            label: "Call Plumber",
            message: "Calling Plumber...",
          ),
          _buildActionButton(
            context,
            icon: Icons.shopping_cart,
            label: "Buy Products",
            message: "Opening Store...",
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(BuildContext context,
      {required IconData icon,
      required String label,
      required String message}) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: 2), // Adds spacing between buttons
      child: ElevatedButton.icon(
        onPressed: () {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(message)));
        },
        icon: Icon(icon),
        label: Text(label),
      ),
    );
  }
}
