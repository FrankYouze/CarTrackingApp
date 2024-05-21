import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:fl_chart/fl_chart.dart';

class myChart extends StatelessWidget {
  const myChart({super.key});

  @override
  Widget build(BuildContext context) {
      return LineChart(

    LineChartData(
        // Set up LineChartData with the data points
        lineBarsData: [
          LineChartBarData(
            //spots: spots,
            isCurved: true,
            color: Colors.blue,
            barWidth: 4,
            isStrokeCapRound: true,
            belowBarData: BarAreaData(show: false),
          ),
        ],
        titlesData: FlTitlesData(
          // Add titles if needed
        ),
        // Add more configurations as needed
      ),
    


    );
  }
}