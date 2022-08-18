import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_poll/controllers/poll_controller.dart';
import 'package:go_poll/models/poll.dart';
import 'package:go_poll/styles/colors.dart';
import 'package:pie_chart/pie_chart.dart';

class PieChartWidget extends GetView<PollController> {
  const PieChartWidget({Key? key, required this.poll}) : super(key: key);
  final Poll poll;
  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = {};
    for (var i = 0; i < poll.options.length; i++) {
      dataMap["${poll.votes[i]}  :  ${poll.options[i].capitalizeFirst}"] =
          poll.votes[i].toDouble();
    }
    final colorList = <Color>[
      const Color.fromARGB(255, 190, 152, 152),
      const Color.fromARGB(255, 255, 111, 0),
      const Color.fromARGB(255, 69, 64, 197),
      const Color.fromARGB(255, 187, 35, 35),
      const Color.fromARGB(255, 80, 60, 60),
      const Color.fromARGB(255, 4, 130, 15),
      const Color.fromARGB(152, 255, 98, 0),
      const Color.fromARGB(255, 186, 18, 186),
      const Color.fromARGB(255, 136, 0, 255),
      const Color.fromARGB(255, 255, 225, 0),
      const Color.fromARGB(255, 18, 175, 186),
      const Color.fromARGB(255, 124, 186, 18),
      const Color.fromARGB(255, 216, 86, 117),
      const Color.fromARGB(255, 86, 136, 216),
    ];

    return PieChart(
      dataMap: dataMap,
      animationDuration: const Duration(milliseconds: 800),
      chartLegendSpacing: 32,
      chartRadius: Get.width / 3.2,
      colorList: colorList,
      emptyColorGradient: const [
        Color(0xff6c5ce7),
        Colors.blue,
      ],
      initialAngleInDegree: 0,
      chartType: ChartType.disc,
      ringStrokeWidth: 32,
      centerTextStyle: const TextStyle(fontFamily: "Puff", color: indigo),
      legendOptions: const LegendOptions(
        showLegendsInRow: false,
        legendPosition: LegendPosition.right,
        showLegends: true,
        legendTextStyle: TextStyle(fontFamily: "Puff", color: white),
      ),
      chartValuesOptions: const ChartValuesOptions(
        showChartValueBackground: true,
        showChartValues: true,
        showChartValuesInPercentage: true,
        showChartValuesOutside: false,
        decimalPlaces: 2,
      ),
    );
  }
}
