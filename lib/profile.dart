// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:path_provider/path_provider.dart';
// import 'dart:io';

// class ProfilePage extends StatelessWidget {
//   final String userName = "Choco Chip";
//   final String address = "Resident of Heaven";
//   final String preferredSettings = "Eco Mode: On";
//   final Map<DateTime, int> heatmapData = {
//     DateTime(2024, 3, 1): 3,
//     DateTime(2024, 3, 2): 7,
//     DateTime(2024, 3, 3): 4,
//     DateTime(2024, 3, 4): 5,
//     DateTime(2024, 3, 5): 8,
//     DateTime(2024, 3, 6): 10,
//     DateTime(2024, 3, 7): 2,
//   };
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Profile")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildUserDetails(),
//             SizedBox(height: 20),
//             _buildConsumptionHeatmap(),
//             SizedBox(height: 20),
//             Center(
//               child: ElevatedButton.icon(
//                 onPressed: _exportToPdf,
//                 icon: Icon(Icons.picture_as_pdf),
//                 label: Text("Export Report to PDF"),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildUserDetails() {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("User Details",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             Divider(),
//             _detailRow(Icons.person, "Name", userName),
//             _detailRow(Icons.home, "Address", address),
//             _detailRow(Icons.settings, "Preferences", preferredSettings),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _detailRow(IconData icon, String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4.0),
//       child: Row(
//         children: [
//           Icon(icon, color: Colors.blue),
//           SizedBox(width: 10),
//           Text("$label: ", style: TextStyle(fontWeight: FontWeight.bold)),
//           Expanded(child: Text(value, overflow: TextOverflow.ellipsis)),
//         ],
//       ),
//     );
//   }

//   Widget _buildConsumptionHeatmap() {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Total Consumption Heatmap",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             SizedBox(height: 10),
//                         HeatMap(
//               datasets: heatmapData,
//               colorMode: .color,
//               defaultColor: Colors.grey[200]!,
//               textColor: Colors.black,
//               colorsets: {
//                 1: Colors.blue[100]!,
//                 3: Colors.blue[300]!,
//                 5: Colors.blue[500]!,
//                 7: Colors.blue[700]!,
//                 10: Colors.blue[900]!,
//               },
//               onClick: (value) {
//                 print("Clicked Date: $value");
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//   //           HeatMap(
//   //             height: 200,
//   //             child: BarChart(
//   //               BarChartData(
//   //                 barGroups: List.generate(7, (index) {
//   //                   return BarChartGroupData(
//   //                     x: index,
//   //                     barRods: [
//   //                       BarChartRodData(
//   //                         toY: (index + 1) * 5.0,
//   //                         gradient: LinearGradient(
//   //                             colors: [Colors.blue, Colors.lightBlueAccent]),
//   //                         width: 20,
//   //                         borderRadius: BorderRadius.circular(4),
//   //                       ),
//   //                     ],
//   //                   );
//   //                 }),
//   //                 titlesData: FlTitlesData(
//   //                   leftTitles: AxisTitles(
//   //                     sideTitles:
//   //                         SideTitles(showTitles: true, reservedSize: 40),
//   //                   ),
//   //                   bottomTitles: AxisTitles(
//   //                     sideTitles: SideTitles(
//   //                       showTitles: true,
//   //                       getTitlesWidget: (double value, TitleMeta meta) {
//   //                         return Text([
//   //                           "Mon",
//   //                           "Tue",
//   //                           "Wed",
//   //                           "Thu",
//   //                           "Fri",
//   //                           "Sat",
//   //                           "Sun"
//   //                         ][value.toInt()]);
//   //                       },
//   //                     ),
//   //                   ),
//   //                 ),
//   //                 borderData: FlBorderData(show: false),
//   //                 gridData: FlGridData(show: false),
//   //               ),
//   //             ),
//   //           ),
//   //         ],
//   //       ),
//   //     ),
//   //   );
//   // }

//   Future<void> _exportToPdf() async {
//     final pdf = pw.Document();

//     pdf.addPage(
//       pw.Page(
//         build: (pw.Context context) => pw.Center(
//           child: pw.Column(
//             mainAxisAlignment: pw.MainAxisAlignment.center,
//             children: [
//               pw.Text("User Profile Report",
//                   style: pw.TextStyle(
//                       fontSize: 24, fontWeight: pw.FontWeight.bold)),
//               pw.SizedBox(height: 20),
//               pw.Text("Name: $userName"),
//               pw.Text("Address: $address"),
//               pw.Text("Preferred Settings: $preferredSettings"),
//               pw.SizedBox(height: 20),
//               pw.Text("Water Consumption (last 7 days):"),
//               pw.BarcodeWidget(
//                 barcode: pw.Barcode.code128(),
//                 data: "1234567890",
//                 width: 200,
//                 height: 50,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );

//     final output = await getExternalStorageDirectory();
//     final file = File("${output!.path}/profile_report.pdf");
//     await file.writeAsBytes(await pdf.save());

//     print("PDF Saved at: ${file.path}");
//   }
// }
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'dart:io';

class ProfilePage extends StatelessWidget {
  final String userName = "Choco Chip";
  final String address = "Resident of Heaven";
  final String preferredSettings = "Eco Mode: On";

  final Map<DateTime, int> heatmapData = {
    DateTime(2024, 3, 1): 3,
    DateTime(2024, 3, 2): 7,
    DateTime(2024, 3, 3): 4,
    DateTime(2024, 3, 4): 5,
    DateTime(2024, 3, 5): 8,
    DateTime(2024, 3, 6): 10,
    DateTime(2024, 3, 7): 2,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildUserDetails(),
            const SizedBox(height: 20),
            _buildConsumptionHeatmap(),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: () => _exportToPdf(context),
                icon: const Icon(Icons.picture_as_pdf),
                label: const Text("Export Report to PDF"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserDetails() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("User Details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Divider(),
            _detailRow(Icons.person, "Name", userName),
            _detailRow(Icons.home, "Address", address),
            _detailRow(Icons.settings, "Preferences", preferredSettings),
          ],
        ),
      ),
    );
  }

  Widget _detailRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue),
          const SizedBox(width: 10),
          Text("$label: ", style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value, overflow: TextOverflow.ellipsis)),
        ],
      ),
    );
  }

  Widget _buildConsumptionHeatmap() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Total Consumption Heatmap",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            HeatMapCalendar(
              datasets: heatmapData,
              colorMode: ColorMode.color,
              defaultColor: Colors.grey[200]!,
              textColor: Colors.black,
              flexible: true, // Makes it responsive
              colorsets: {
                1: Colors.blue[100]!,
                3: Colors.blue[300]!,
                5: Colors.blue[500]!,
                7: Colors.blue[700]!,
                10: Colors.blue[900]!,
              },
              onClick: (date) {
                print("Clicked Date: $date");
              },
            ),
          ],
        ),
      ),
    );
  }

//   Future<void> _exportToPdf() async {
//     final pdf = pw.Document();

//     pdf.addPage(
//       pw.Page(
//         build: (pw.Context context) => pw.Center(
//           child: pw.Column(
//             mainAxisAlignment: pw.MainAxisAlignment.center,
//             children: [
//               pw.Text("User Profile Report",
//                   style: pw.TextStyle(
//                       fontSize: 24, fontWeight: pw.FontWeight.bold)),
//               pw.SizedBox(height: 20),
//               pw.Text("Name: $userName"),
//               pw.Text("Address: $address"),
//               pw.Text("Preferred Settings: $preferredSettings"),
//               pw.SizedBox(height: 20),
//               pw.Text("Water Consumption (last 7 days):"),
//               pw.SizedBox(height: 10),
//               pw.BarcodeWidget(
//                 barcode: pw.Barcode.code128(),
//                 data: "1234567890",
//                 width: 200,
//                 height: 50,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );

//     final output = await getApplicationDocumentsDirectory();
//     final file = File("${output.path}/profile_report.pdf");
//     await file.writeAsBytes(await pdf.save());

//     print("PDF Saved at: ${file.path}");
//   }
  Future<void> _exportToPdf(BuildContext context) async {
    // Show snackbar while exporting
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Exporting report to PDF..."),
        duration: Duration(seconds: 2),
      ),
    );

    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Center(
          child: pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              pw.Text("User Profile Report",
                  style: pw.TextStyle(
                      fontSize: 24, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 20),
              pw.Text("Name: $userName"),
              pw.Text("Address: $address"),
              pw.Text("Preferred Settings: $preferredSettings"),
              pw.SizedBox(height: 20),
              pw.Text("Water Consumption (last 7 days):"),
              pw.SizedBox(height: 10),
              pw.BarcodeWidget(
                barcode: pw.Barcode.code128(),
                data: "1234567890",
                width: 200,
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );

    try {
      final output = await getApplicationDocumentsDirectory();
      final file = File("${output.path}/profile_report.pdf");
      await file.writeAsBytes(await pdf.save());

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("PDF saved successfully at: ${file.path}"),
          duration: const Duration(seconds: 3),
        ),
      );

      print("PDF Saved at: ${file.path}");
    } catch (e) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Failed to export PDF. Please try again."),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }
}
