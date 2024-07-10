import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PurchaseData {
  final DateTime date;
  final int points;

  PurchaseData(this.date, this.points);
}

class SpendData {
  final DateTime date;
  final int points;

  SpendData(this.date, this.points);
}

class SplineArea extends StatelessWidget {
  SplineArea({super.key});
  final List<PurchaseData> purchasedData = [
    PurchaseData(DateTime.now().subtract(const Duration(days: 6)), 10),
    PurchaseData(DateTime.now().subtract(const Duration(days: 5)), 30),
    PurchaseData(DateTime.now().subtract(const Duration(days: 4)), 25),
    PurchaseData(DateTime.now().subtract(const Duration(days: 3)), 60),
    PurchaseData(DateTime.now().subtract(const Duration(days: 2)), 40),
    PurchaseData(DateTime.now().subtract(const Duration(days: 1)), 30),
    PurchaseData(DateTime.now(), 70),
  ];

  final List<SpendData> spentData = [
    SpendData(DateTime.now().subtract(const Duration(days: 6)), 10),
    SpendData(DateTime.now().subtract(const Duration(days: 5)), 25),
    SpendData(DateTime.now().subtract(const Duration(days: 4)), 20),
    SpendData(DateTime.now().subtract(const Duration(days: 3)), 25),
    SpendData(DateTime.now().subtract(const Duration(days: 2)), 35),
    SpendData(DateTime.now().subtract(const Duration(days: 1)), 25),
    SpendData(DateTime.now(), 65),
  ];
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: DateTimeAxis(
        majorGridLines: const MajorGridLines(width: 0),
        axisLine: const AxisLine(width: 0),
      ),
      primaryYAxis: NumericAxis(
        majorGridLines: const MajorGridLines(width: 0),
        axisLine: const AxisLine(width: 0),
      ),
      series: <SplineAreaSeries>[
        SplineAreaSeries<PurchaseData, DateTime>(
          dataSource: purchasedData,
          xValueMapper: (PurchaseData data, _) => data.date,
          yValueMapper: (PurchaseData data, _) => data.points,
          color: const Color(0xff008ffb),
          opacity: 0.2,
          borderColor: const Color(0xff008ffb),
          borderWidth: 2,
        ),
        SplineAreaSeries<SpendData, DateTime>(
          dataSource: spentData,
          xValueMapper: (SpendData data, _) => data.date,
          yValueMapper: (SpendData data, _) => data.points,
          color: const Color(0xff00e396),
          opacity: 0.2,
          borderColor: const Color(0xff00e396),
          borderWidth: 2,
        ),
      ],
    );
  }
}
