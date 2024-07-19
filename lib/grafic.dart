import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Grafic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exam Graphics')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LineChartSample2(),
      ),
    );
  }
}

class LineChartSample2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                switch (value.toInt()) {
                  case 0:
                    return Text('week 1');
                  case 1:
                    return Text('week 3');
                  case 2:
                    return Text('average');
                }
                return Container();
              },
            ),
          ),
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d)),
        ),
        lineBarsData: [
          _buildLineChartBarData([100, 90, 95], Colors.blue, 'A.Hakimov'),
          _buildLineChartBarData([70, 80, 75], Colors.green, 'S.Shoimardonov'),
          _buildLineChartBarData([95, 85, 90], Colors.purple, 'S.Mahmudzoda'),
          _buildLineChartBarData([20, 30, 25], Colors.red, 'S.Saifuddinov'),
          _buildLineChartBarData([60, 70, 65], Colors.yellow, 'M.Aslamzoda'),
          _buildLineChartBarData([30, 40, 35], Colors.orange, 'H.Sharifzoda'),
          _buildLineChartBarData(
              [80, 85, 82.5], Colors.lightGreen, 'Y.Odinaev'),
        ],
      ),
    );
  }

  LineChartBarData _buildLineChartBarData(
      List<double> data, Color colore, String name) {
    return LineChartBarData(
      spots: data
          .asMap()
          .entries
          .map((entry) => FlSpot(entry.key.toDouble(), entry.value))
          .toList(),
      isCurved: true,
      color: colore,
      barWidth: 4,
      isStrokeCapRound: true,
      dotData: FlDotData(show: true),
      belowBarData: BarAreaData(show: false),
    );
  }
}
