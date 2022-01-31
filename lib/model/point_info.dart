// ignore_for_file: avoid_print
import 'package:fl_chart/fl_chart.dart';
import 'dart:convert';



class PointInfo {
  String uEMAIL = '';
  String cMemberNo = '';
  String pOrderSerial = '';
  String pInday1 = '';
  int pPayType = 0; // 1:현금, 2:카드, 8:차감
  double pCashPoint = 0.0; //현금
  double pCardPoint = 0.0; //카드
  double pUsePoint = 0.0; //사용
  double pLeftPoint = 0.0; //남은
  String pMemo = '';
  int pIsDel = 0;
  String pLastDt = '';

  double pTotScore = 0.0; // 누적 현금+카드 적립금
  String cNickName = '';
  String cTel = '';

  PointInfo();
  PointInfo.data(this.uEMAIL, this.cMemberNo, this.pOrderSerial, this.pInday1, this.pPayType, this.pCashPoint,
      this.pCardPoint, this.pUsePoint, this.pLeftPoint, this.pMemo, this.pIsDel, this.pLastDt,
      {this.cNickName = '', this.cTel = ''});

  factory PointInfo.from(PointInfo objectA) {
    return PointInfo.data(
        objectA.uEMAIL,
        objectA.cMemberNo,
        objectA.pOrderSerial,
        objectA.pInday1,
        objectA.pPayType,
        objectA.pCashPoint,
        objectA.pCardPoint,
        objectA.pUsePoint,
        objectA.pLeftPoint,
        objectA.pMemo,
        objectA.pIsDel,
        objectA.pLastDt);
  }

  clear({bool bAll = false}) {
    if (bAll == true) {
      uEMAIL = '';
      cMemberNo = '';
      pOrderSerial = '';
    }

    pInday1 = '';
    pPayType = 0;
    pCashPoint = 0.0;
    pCardPoint = 0.0;
    pUsePoint = 0.0;
    pCashPoint = 0.0;
    pLeftPoint = 0;
    pMemo = '';
    pIsDel = 0;
    pLastDt = '';
  }

  static List<BarChartGroupData> getData() {

    List<BarChartGroupData> groups=[];

    List<BarChartRodData> rodList=[];
    BarChartRodData rodData = BarChartRodData(y:17000000000);
    rodList.add(rodData);

    BarChartGroupData groupData = BarChartGroupData(x:0, barsSpace:4, barRods: rodList);

    groups.add(groupData);


    return groups;

  }
  //
  // static PointInfo fromJson3(Map<String, dynamic> json) {
  //   PointInfo info = PointInfo();
  //
  //   info.uEMAIL = json['EMAIL'];
  //   info.cMemberNo = json['MemberNo'];
  //   info.pOrderSerial = json['OrderSerial'];
  //   info.pInday1 = json['Inday1'];
  //   info.pPayType = CvtUtil.parseInt(json['PayType']);
  //   info.pCashPoint = CvtUtil.parseAmt(json['CashPoint']);
  //   info.pCardPoint = CvtUtil.parseAmt(json['CardPoint']);
  //   info.pUsePoint = CvtUtil.parseAmt(json['UsePoint']);
  //   info.pLeftPoint = CvtUtil.parseAmt(json['LeftPoint']);
  //   info.pMemo = json['Memo'];
  //   info.pIsDel = CvtUtil.parseInt(json['IsDel']);
  //   info.pLastDt = json['LastDt'];
  //
  //   return info;
  // }
  //
  // fromJson(Map<String, dynamic> json) {
  //   try {
  //     uEMAIL = json['EMAIL'];
  //     cMemberNo = json['MemberNo'];
  //     pOrderSerial = json['OrderSerial'];
  //     pInday1 = json['Inday1'];
  //     pPayType = CvtUtil.parseInt(json['PayType']);
  //     pCashPoint = CvtUtil.parseAmt(json['CashPoint']);
  //     pCardPoint = CvtUtil.parseAmt(json['CardPoint']);
  //     pUsePoint = CvtUtil.parseAmt(json['UsePoint']);
  //     pLeftPoint = CvtUtil.parseAmt(json['LeftPoint']);
  //     pMemo = json['Memo'];
  //     pIsDel = CvtUtil.parseInt(json['IsDel']);
  //     pLastDt = json['LastDt'];
  //   } catch (e) {
  //     print(e);
  //   }
  // }
  //
  // Map<String, dynamic> toJson() {
  //   return <String, dynamic>{
  //     '"EMAIL"': json.encode(uEMAIL),
  //     '"MemberNo"': json.encode(cMemberNo),
  //     '"OrderSerial"': json.encode(pOrderSerial),
  //     '"Inday1"': json.encode(pInday1),
  //     '"PayType"': json.encode(pPayType),
  //     '"CashPoint"': json.encode(pCashPoint),
  //     '"CardPoint"': json.encode(pCardPoint),
  //     '"UsePoint"': json.encode(pUsePoint),
  //     '"LeftPoint"': json.encode(pLeftPoint),
  //     '"Memo"': json.encode(pMemo),
  //     '"IsDel"': json.encode(pIsDel),
  //     '"LastDt"': json.encode(pLastDt)
  //   };
  // }
  //
  // Map<String, dynamic> toMap() {
  //   return {
  //     'U_PK_CODE': uEMAIL,
  //     'MemberNo': cMemberNo,
  //     'OrderSerial': pOrderSerial,
  //     'Inday1': pInday1,
  //     'PayType': pPayType,
  //     'CashPoint': pCashPoint,
  //     'CardPoint': pCardPoint,
  //     'UsePoint': pUsePoint,
  //     'LeftPoint': pLeftPoint,
  //     'Memo': pMemo,
  //     'IsDel': pIsDel,
  //     'LastDt': pLastDt
  //   };
  // }
}