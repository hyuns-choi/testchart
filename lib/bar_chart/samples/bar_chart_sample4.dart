import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../model/point_info.dart';
import 'package:intl/intl.dart';


class BarChartSample4 extends StatefulWidget {
  const BarChartSample4({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BarChartSample4State();
}

class BarChartSample4State extends State<BarChartSample4> {
  final Color dark = const Color(0xff3b8c75);
  final Color normal = const Color(0xff64caad);
  final Color light = const Color(0xff73e8c9);

  List<PointInfo> _listPoint = [];

  @override
  void initState(){
    super.initState();

    for(int i=1; i<10; i++) {
      PointInfo info=PointInfo();
      info.pInday1 = '2020\n01-0$i';
      info.pCashPoint = (i) * 1000;
      info.pCardPoint = (i) * 10000;

      if(i%3 == 0) {
        info.pUsePoint = (i) * 1000;
      }
      _listPoint.add(info);
    }
    for(int i=1; i<10; i++) {
      PointInfo info=PointInfo();
      info.pInday1 = '2020\n02-0$i';
      info.pCashPoint = (i) * 1000;
      info.pCardPoint = (i) * 10000;

      if(i%3 == 0) {
        info.pUsePoint = (i) * 1000;
      }
      _listPoint.add(info);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.66,
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.start,
            barTouchData: BarTouchData(
              enabled: true,
            ),
            titlesData: FlTitlesData(
              show: true,
              bottomTitles: SideTitles(
                showTitles: true,
                getTextStyles: (context, value) =>
                    const TextStyle(color: Color(0xff939393), fontSize: 10),
                margin: 10,
                getTitles: (double value) {
                  print('###'+ value.toInt().toString());
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
                getTextStyles: (context, value) => const TextStyle(
                    color: Color(
                      0xff939393,
                    ),
                    fontSize: 10),
                margin: 0,
              ),
              topTitles: SideTitles(showTitles: false),
              rightTitles: SideTitles(showTitles: false),
            ),
            gridData: FlGridData(
              show: true,
              checkToShowHorizontalLine: (value) => value % 10 == 0,
              getDrawingHorizontalLine: (value) => FlLine(
                color: const Color(0xffe7e8ec),
                strokeWidth: 1,
              ),
            ),
            borderData: FlBorderData(
              show: false,
            ),
            groupsSpace: 14,
            barGroups: getData2(),
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

    List<BarChartGroupData> groups=[];

    for(int i=0; i<_listPoint.length; i++) {
      PointInfo info = _listPoint[i];
      List<BarChartRodData> rodList = [];

      List<BarChartRodStackItem> rodStackList=[];


      rodStackList.add(BarChartRodStackItem(0, info.pCashPoint, Colors.red));
      rodStackList.add(BarChartRodStackItem(info.pCashPoint, info.pCashPoint+info.pCardPoint, Colors.blueGrey));

      BarChartRodData rodData = BarChartRodData(y: (info.pCashPoint+info.pCardPoint), rodStackItems:rodStackList);
      rodList.add(rodData);

      rodList.add(BarChartRodData(y: (info.pUsePoint), colors: [Colors.blue]));

      BarChartGroupData groupData = BarChartGroupData(
          x: i, barsSpace: 4, barRods: rodList);

      groups.add(groupData);
    }


    return groups;

  }
  List<BarChartGroupData> getData() {
    return [
      BarChartGroupData(
        x: 0,
        barsSpace: 4,
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
              colors:[Colors.blue,Colors.red],
              borderRadius: const BorderRadius.all(Radius.zero)),

        ],
      ),
      BarChartGroupData(
        x: 1,
        barsSpace: 4,
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
              colors:[Colors.blue,Colors.red],
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
