import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:neersense/detailedAnalytics.dart';

class AnalyticsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Water Usage Analytics")),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Line Graph for Daily/Weekly/Monthly Usage
              _buildUsageGraph(),

              SizedBox(height: 20),

              // Future Predictions Box
              _buildFuturePredictions(),

              SizedBox(height: 20),

              // Water Consumption Breakdown (Room-wise)
              _buildWaterConsumptionBreakdown(context),

              SizedBox(height: 20),

              // Button to navigate to Detailed Analytics
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailedAnalyticsPage()),
                  );
                },
                child: Text("View Total Analytics"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUsageGraph() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Usage Trends",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Container(
          height: 200,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(blurRadius: 5, color: Colors.grey.shade300)],
          ),
          child: LineChart(
            LineChartData(
              titlesData: FlTitlesData(show: true),
              borderData: FlBorderData(show: false),
              lineBarsData: [
                LineChartBarData(
                  spots: [
                    FlSpot(1, 20),
                    FlSpot(2, 50),
                    FlSpot(3, 30),
                    FlSpot(4, 60),
                    FlSpot(5, 40),
                  ],
                  isCurved: true,
                  color: Colors.blue,
                  barWidth: 4,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFuturePredictions() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text("Future Water Usage Prediction",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text("Predicted usage per faucet:"),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(children: [Text("Kitchen"), Text("25L")]),
              Column(children: [Text("Bathroom"), Text("45L")]),
              Column(children: [Text("Garden"), Text("15L")]),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWaterConsumptionBreakdown(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Water Consumption Breakdown",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Container(
          height: 200,
          child: PieChart(
            PieChartData(
              sectionsSpace: 2,
              centerSpaceRadius: 40,
              sections: [
                _buildPieSection(40, Colors.blue, "Bathroom", context),
                _buildPieSection(30, Colors.green, "Kitchen", context),
                _buildPieSection(20, Colors.orange, "Garden", context),
              ],
            ),
          ),
        ),
      ],
    );
  }

  PieChartSectionData _buildPieSection(
      double value, Color color, String title, BuildContext context) {
    return PieChartSectionData(
      value: value,
      color: color,
      title: title,
      radius: 50,
      titleStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      showTitle: true,
      badgeWidget: GestureDetector(
        onTap: () {
          _showHistoryDialog(context, title);
        },
        child: Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
      ),
    );
  }

  void _showHistoryDialog(BuildContext context, String category) {
    // Sample water consumption history data
    Map<String, List<double>> historyData = {
      "Kitchen": [25, 30, 28, 35, 40],
      "Bathroom": [40, 12, 45, 55, 30],
      "Garden": [5, 18, 20, 22, 10],
    };

    List<String> days = ["Mon", "Tue", "Wed", "Thu", "Fri"];

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("$category Usage History"),
          content: Container(
            height: 250,
            width: 300,
            child: BarChart(
              BarChartData(
                barGroups: List.generate(
                  historyData[category]?.length ?? 0,
                  (index) => BarChartGroupData(
                    x: index,
                    barRods: [
                      BarChartRodData(
                        toY: historyData[category]![index],
                        color: Colors.blue,
                        width: 20,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ],
                  ),
                ),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: true, reservedSize: 40),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (double value, TitleMeta meta) {
                        return Text(days[value.toInt()],
                            style: TextStyle(fontSize: 12));
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                gridData: FlGridData(show: false),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }
}
