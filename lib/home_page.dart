// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:server_app_test/api_wrap.dart';
import 'package:server_app_test/card_datum.dart';
import 'package:server_app_test/error_obj.dart';
import 'package:server_app_test/build_card_util.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<CardDatum>> fetchPageData() async {
    var response = await ApiWrap().get('cards/home');
    String? body = response.body;

    if (response.statusCode >= 400) {
      ErrorOBj eobj =
          ErrorOBj(type: "error", message: body ?? "에러 메시지가 반환되지 않았습니다");
      print(eobj.toString());
      return List.empty();
    }

    if (body == null || body!.isEmpty) {
      ErrorOBj eobj = ErrorOBj(type: "error", message: "반환된 데이터가 빈값입니다");
      print(eobj.toString());
      return List.empty();
    }

    List<dynamic> decode = json.decode(body!);
    List<CardDatum> cardData =
        decode.map((e) => CardDatum.fromJson(e)).toList();

    return cardData;

    // //guard cardType
    // if (cardType == null) {
    //   ErrorOBj eObj = ErrorOBj(
    //       type: "error",
    //       message: "카드 타입이 올바르지 않습니다(received:${cardResponse.kind}");
    //   print(eObj.toString());
    //   return;
    // }
  } // fetchPageData

  List<Widget> buildCards(List<CardDatum> cardData) {
    List<Widget> cardList = [];

    // 카드 밑에 높이8의 빈공간 추가
    for (var datum in cardData) {
      CardType? type = datum.cardType();
      if (type == null) {
        ErrorOBj eobj = ErrorOBj(
            type: "build error", message: "카드 데이터의 타입이 올바르지 않다(${datum.type})");
        print(eobj.toString());
        continue;
      }

      Widget cardWidget = BuildCardUtil().build(type, datum.data);
      cardList.add(cardWidget);
      Widget blank = const SizedBox(height: 8);
      cardList.add(blank);
    }

    return cardList;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
            child: FutureBuilder<List<CardDatum>>(
          future: fetchPageData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.isEmpty) {
                return const CircularProgressIndicator();
              }
              var cards = buildCards(snapshot.data!);
              return ListView(
                children: [...cards],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        )),
      ),
    );
  }
}
