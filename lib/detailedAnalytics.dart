// import 'package:flutter/material.dart';

// class DetailedAnalyticsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Detailed Water Usage Analytics")),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             _buildFaucetBreakdown(),
//             SizedBox(height: 20),
//             _buildCostEstimation(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildFaucetBreakdown() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text("Faucet-wise Breakdown",
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//         SizedBox(height: 10),
//         Table(
//           border: TableBorder.all(),
//           columnWidths: {
//             0: FractionColumnWidth(0.5),
//             1: FractionColumnWidth(0.5)
//           },
//           children: [
//             TableRow(children: [
//               Padding(
//                   padding: EdgeInsets.all(8),
//                   child: Text("Faucet",
//                       style: TextStyle(fontWeight: FontWeight.bold))),
//               Padding(
//                   padding: EdgeInsets.all(8),
//                   child: Text("Usage (Liters)",
//                       style: TextStyle(fontWeight: FontWeight.bold))),
//             ]),
//             TableRow(children: [
//               Padding(padding: EdgeInsets.all(8), child: Text("Kitchen")),
//               Padding(padding: EdgeInsets.all(8), child: Text("25L"))
//             ]),
//             TableRow(children: [
//               Padding(padding: EdgeInsets.all(8), child: Text("Bathroom")),
//               Padding(padding: EdgeInsets.all(8), child: Text("45L"))
//             ]),
//             TableRow(children: [
//               Padding(padding: EdgeInsets.all(8), child: Text("Garden")),
//               Padding(padding: EdgeInsets.all(8), child: Text("15L"))
//             ]),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildCostEstimation() {
//     return Container(
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.yellow[50],
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         children: [
//           Text("Estimated Monthly Water Bill",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//           SizedBox(height: 10),
//           Text("₹1200 (Based on current usage)"),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DetailedAnalyticsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detailed Water Usage Analytics")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildUsageSummary(),
            SizedBox(height: 20),
            _buildUsageChart(),
            SizedBox(height: 20),
            _buildHighlights(),
            SizedBox(height: 20),
            _buildCostEstimation(),
          ],
        ),
      ),
    );
  }

  /// 📌 **1. Usage Summary (Average Water Consumption)**
  Widget _buildUsageSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("AVERAGE", style: TextStyle(fontSize: 14, color: Colors.grey)),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("120L / day",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text("28 Feb - 6 Mar 2025",
                style: TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ],
    );
  }

  /// 📊 **2. Faucet-wise Usage Chart (Bar Graph)**
  Widget _buildUsageChart() {
    return Container(
      height: 200,
      child: BarChart(
        BarChartData(
          barGroups: _generateBarData(),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
            bottomTitles: AxisTitles(sideTitles: _bottomTitles()),
          ),
          borderData: FlBorderData(show: false),
        ),
      ),
    );
  }

  List<BarChartGroupData> _generateBarData() {
    List<int> usage = [50, 80, 30, 60, 40]; // Example usage (liters)
    return List.generate(usage.length, (index) {
      return BarChartGroupData(x: index, barRods: [
        BarChartRodData(
            toY: usage[index].toDouble(), color: Colors.blue, width: 16),
      ]);
    });
  }

  SideTitles _bottomTitles() {
    return SideTitles(
      showTitles: true,
      getTitlesWidget: (double value, TitleMeta meta) {
        List<String> labels = [
          "Kitchen",
          "Bathroom",
          "Garden",
          "Laundry",
          "Other"
        ];
        return Padding(
          padding: EdgeInsets.only(top: 5),
          child: Text(labels[value.toInt()], style: TextStyle(fontSize: 12)),
        );
      },
    );
  }

  /// 🔥 **3. Highlights Section**
  Widget _buildHighlights() {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("⚠ Water Usage Alert",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.orangeAccent,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Text("You're using 20% more water than usual.",
              style: TextStyle(fontSize: 14, color: Colors.white)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Today",
                  style: TextStyle(color: Colors.white, fontSize: 16)),
              Text("140L", style: TextStyle(color: Colors.white, fontSize: 16)),
            ],
          ),
          Divider(color: Colors.grey),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Average",
                  style: TextStyle(color: Colors.grey, fontSize: 14)),
              Text("120L", style: TextStyle(color: Colors.grey, fontSize: 14)),
            ],
          ),
        ],
      ),
    );
  }

  /// 💰 **4. Estimated Water Bill**
  Widget _buildCostEstimation() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.yellow[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text("Estimated Monthly Water Bill",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text("₹1200 (Based on current usage)",
              style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
