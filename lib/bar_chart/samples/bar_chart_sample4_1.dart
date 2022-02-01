// ignore_for_file: camel_case_types

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'model/point_info.dart';

class BarChartSample4_1 extends StatefulWidget {
  const BarChartSample4_1({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BarChartSample4_1State();
}

class BarChartSample4_1State extends State<BarChartSample4_1> {
  final Color dark = const Color(0xff3b8c75);
  final Color normal = const Color(0xff64caad);
  final Color light = const Color(0xff73e8c9);

  //late ScrollController _scrollController;

  List<PointInfo> _listPoint = [];

  @override
  void initState() {
    super.initState();

    //_scrollController = ScrollController();

    for (int i = 1; i < 10; i++) {
      PointInfo info = PointInfo();
      info.pInday1 = '2020\n01-0$i';
      info.pCashPoint = (i) * 1000;
      info.pCardPoint = (i) * 10000;

      if (i % 3 == 0) {
        info.pUsePoint = (i) * 1000;
      }
      _listPoint.add(info);
    }
    for (int i = 1; i < 10; i++) {
      PointInfo info = PointInfo();
      info.pInday1 = '2020\n02-0$i';
      info.pCashPoint = (i) * 1000;
      info.pCardPoint = (i) * 10000;

      if (i % 3 == 0) {
        info.pUsePoint = (i) * 1000;
      }
      _listPoint.add(info);
    }

    for (int i = 1; i < 10; i++) {
      PointInfo info = PointInfo();
      info.pInday1 = '2020\n03-0$i';
      info.pCashPoint = (i) * 1000;
      info.pCardPoint = (i) * 10000;

      if (i % 3 == 0) {
        info.pUsePoint = (i) * 1000;
      }
      _listPoint.add(info);
    }
  }

  @override
  void dispose() {
    //_scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      //controller: _scrollController,
      scrollDirection: Axis.horizontal,
      child: Container(
        width: 1300,
        padding: const EdgeInsets.all(20),
        child: Expanded(
          child: BarChart(
            BarChartData(
              //alignment: BarChartAlignment.center,
              barTouchData: BarTouchData(
                enabled: true,
              ),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: SideTitles(
                  showTitles: true,
                  getTextStyles: (context, value) =>
                      const TextStyle(color: Colors.black, fontSize: 10),
                  margin: 10,
                  getTitles: (double value) {
                    print('###' + value.toInt().toString());
                    return _listPoint[value.toInt()].pInday1;
                    // switch (value.toInt()) {
                    //   case 0:
                    //     return '2022\n01-01';
                    //   case 1:
                    //     return '2022\n01-02';
                    //   case 2:
                    //     return '2022-01-03';
                    //   case 3:
                    //     return '2022-01-04';
                    //   case 4:
                    //     return '2022-01-05';
                    //   default:
                    //     return '';
                    // }
                  },
                ),
                leftTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 40,
                  getTitles: defaultGetTitle2,
                  getTextStyles: (context, value) =>
                      const TextStyle(color: Colors.black, fontSize: 10),
                  margin: 0,
                ),
                topTitles: SideTitles(showTitles: false),
                rightTitles: SideTitles(showTitles: false),
              ),
              gridData: FlGridData(
                show: false,
                checkToShowHorizontalLine: (value) => value % 10 == 0,
                getDrawingHorizontalLine: (value) => FlLine(
                  color: const Color(0xffe7e8ec),
                  strokeWidth: 1,
                ),
              ),
              borderData: FlBorderData(
                show: false,
              ),
              groupsSpace: 20,
              barGroups: getData2(),
            ),
          ),
        ),
      ),
    );
  }

  String defaultGetTitle2(double value) {
    var f = NumberFormat('###,###,###,###');

    return f.format(value);
  }

  List<BarChartGroupData> getData2() {
    List<BarChartGroupData> groups = [];

//rodList.add(BarChartRodData(y: (info.pUsePoint), colors: [Colors.blue]));
    for (int i = 0; i < _listPoint.length; i++) {
      PointInfo info = _listPoint[i];
      List<BarChartRodData> rodList = [];

      List<BarChartRodStackItem> rodStackList = [];

      rodStackList.add(BarChartRodStackItem(00, info.pCashPoint, Colors.red));
      rodStackList.add(BarChartRodStackItem(
          info.pCashPoint, info.pCashPoint + info.pCardPoint, Colors.blueGrey));

      //if (info.pUsePoint < 10) {
      rodList.add(BarChartRodData(
          width: 10,
          y: (0),
          colors: [Colors.blue],
          borderRadius: const BorderRadius.all(Radius.zero)));
      //}

      BarChartRodData rodData = BarChartRodData(
          width: 20,
          y: (info.pCashPoint + info.pCardPoint),
          rodStackItems: rodStackList,
          borderRadius: const BorderRadius.all(Radius.zero));
      rodList.add(rodData);

      rodList.add(BarChartRodData(
          width: 20,
          y: (info.pUsePoint),
          colors: [Colors.blue],
          borderRadius: const BorderRadius.all(Radius.zero)));

      if (info.pUsePoint > 0) {
        rodList.add(BarChartRodData(
            width: 10,
            y: (0),
            colors: [Colors.blue],
            borderRadius: const BorderRadius.all(Radius.zero)));
      }

      BarChartGroupData groupData =
          BarChartGroupData(x: i, barsSpace: 1, barRods: rodList);

      groups.add(groupData);
    }

    return groups;
  }

  List<BarChartGroupData> getData() {
    return [
      BarChartGroupData(
        x: 0,
        barsSpace: 1,
        barRods: [
          BarChartRodData(
              width: 20,
              y: 17000000000,
              rodStackItems: [
                BarChartRodStackItem(0, 2000000000, Colors.red),
                BarChartRodStackItem(2000000000, 12000000000, Colors.blueGrey),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              width: 20,
              y: 4000000000,
              colors: [Colors.blue, Colors.red],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 1,
        barsSpace: 1,
        barRods: [
          BarChartRodData(
              y: 17000000000,
              rodStackItems: [
                BarChartRodStackItem(0, 2000000000, Colors.red),
                BarChartRodStackItem(2000000000, 12000000000, Colors.blueGrey),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              y: 4000000000,
              colors: [Colors.blue, Colors.red],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      // BarChartGroupData(
      //   x: 1,
      //   barsSpace: 4,
      //   barRods: [
      //     BarChartRodData(
      //         y: 31000000000,
      //         rodStackItems: [
      //           BarChartRodStackItem(0, 11000000000, dark),
      //           BarChartRodStackItem(11000000000, 18000000000, normal),
      //           BarChartRodStackItem(18000000000, 31000000000, light),
      //         ],
      //         borderRadius: const BorderRadius.all(Radius.zero)),
      //     BarChartRodData(
      //         y: 35000000000,
      //         rodStackItems: [
      //           BarChartRodStackItem(0, 14000000000, dark),
      //           BarChartRodStackItem(14000000000, 27000000000, normal),
      //           BarChartRodStackItem(27000000000, 35000000000, light),
      //         ],
      //         borderRadius: const BorderRadius.all(Radius.zero)),
      //     BarChartRodData(
      //         y: 31000000000,
      //         rodStackItems: [
      //           BarChartRodStackItem(0, 8000000000, dark),
      //           BarChartRodStackItem(8000000000, 24000000000, normal),
      //           BarChartRodStackItem(24000000000, 31000000000, light),
      //         ],
      //         borderRadius: const BorderRadius.all(Radius.zero)),
      //     BarChartRodData(
      //         y: 15000000000,
      //         rodStackItems: [
      //           BarChartRodStackItem(0, 6000000000.5, dark),
      //           BarChartRodStackItem(6000000000.5, 12000000000.5, normal),
      //           BarChartRodStackItem(12000000000.5, 15000000000, light),
      //         ],
      //         borderRadius: const BorderRadius.all(Radius.zero)),
      //     BarChartRodData(
      //         y: 17000000000,
      //         rodStackItems: [
      //           BarChartRodStackItem(0, 9000000000, dark),
      //           BarChartRodStackItem(9000000000, 15000000000, normal),
      //           BarChartRodStackItem(15000000000, 17000000000, light),
      //         ],
      //         borderRadius: const BorderRadius.all(Radius.zero)),
      //   ],
      // ),
      // BarChartGroupData(
      //   x: 2,
      //   barsSpace: 4,
      //   barRods: [
      //     BarChartRodData(
      //         y: 34000000000,
      //         rodStackItems: [
      //           BarChartRodStackItem(0, 6000000000, dark),
      //           BarChartRodStackItem(6000000000, 23000000000, normal),
      //           BarChartRodStackItem(23000000000, 34000000000, light),
      //         ],
      //         borderRadius: const BorderRadius.all(Radius.zero)),
      //     BarChartRodData(
      //         y: 32000000000,
      //         rodStackItems: [
      //           BarChartRodStackItem(0, 7000000000, dark),
      //           BarChartRodStackItem(7000000000, 24000000000, normal),
      //           BarChartRodStackItem(24000000000, 32000000000, light),
      //         ],
      //         borderRadius: const BorderRadius.all(Radius.zero)),
      //     BarChartRodData(
      //         y: 14000000000.5,
      //         rodStackItems: [
      //           BarChartRodStackItem(0, 1000000000.5, dark),
      //           BarChartRodStackItem(1000000000.5, 12000000000, normal),
      //           BarChartRodStackItem(12000000000, 14000000000.5, light),
      //         ],
      //         borderRadius: const BorderRadius.all(Radius.zero)),
      //     BarChartRodData(
      //         y: 20000000000,
      //         rodStackItems: [
      //           BarChartRodStackItem(0, 4000000000, dark),
      //           BarChartRodStackItem(4000000000, 15000000000, normal),
      //           BarChartRodStackItem(15000000000, 20000000000, light),
      //         ],
      //         borderRadius: const BorderRadius.all(Radius.zero)),
      //     BarChartRodData(
      //         y: 24000000000,
      //         rodStackItems: [
      //           BarChartRodStackItem(0, 4000000000, dark),
      //           BarChartRodStackItem(4000000000, 15000000000, normal),
      //           BarChartRodStackItem(15000000000, 24000000000, light),
      //         ],
      //         borderRadius: const BorderRadius.all(Radius.zero)),
      //   ],
      // ),
      // BarChartGroupData(
      //   x: 3,
      //   barsSpace: 4,
      //   barRods: [
      //     BarChartRodData(
      //         y: 14000000000,
      //         rodStackItems: [
      //           BarChartRodStackItem(0, 1000000000.5, dark),
      //           BarChartRodStackItem(1000000000.5, 12000000000, normal),
      //           BarChartRodStackItem(12000000000, 14000000000, light),
      //         ],
      //         borderRadius: const BorderRadius.all(Radius.zero)),
      //     BarChartRodData(
      //         y: 27000000000,
      //         rodStackItems: [
      //           BarChartRodStackItem(0, 7000000000, dark),
      //           BarChartRodStackItem(7000000000, 25000000000, normal),
      //           BarChartRodStackItem(25000000000, 27000000000, light),
      //         ],
      //         borderRadius: const BorderRadius.all(Radius.zero)),
      //     BarChartRodData(
      //         y: 29000000000,
      //         rodStackItems: [
      //           BarChartRodStackItem(0, 6000000000, dark),
      //           BarChartRodStackItem(6000000000, 23000000000, normal),
      //           BarChartRodStackItem(23000000000, 29000000000, light),
      //         ],
      //         borderRadius: const BorderRadius.all(Radius.zero)),
      //     BarChartRodData(
      //         y: 16000000000.5,
      //         rodStackItems: [
      //           BarChartRodStackItem(0, 9000000000, dark),
      //           BarChartRodStackItem(9000000000, 15000000000, normal),
      //           BarChartRodStackItem(15000000000, 16000000000.5, light),
      //         ],
      //         borderRadius: const BorderRadius.all(Radius.zero)),
      //     BarChartRodData(
      //         y: 15000000000,
      //         rodStackItems: [
      //           BarChartRodStackItem(0, 7000000000, dark),
      //           BarChartRodStackItem(7000000000, 12000000000.5, normal),
      //           BarChartRodStackItem(12000000000.5, 15000000000, light),
      //         ],
      //         borderRadius: const BorderRadius.all(Radius.zero)),
      //  ],
      //),
    ];
  }
}
