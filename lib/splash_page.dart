import 'dart:async';

import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  SplashPage({
    super.key,
  });

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    fetchPageData();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: const Scaffold(
        body: SafeArea(
          child: Center(
            child: Text('splash'),
          ),
        ),
      ),
    );
  }

  fetchPageData() {
    // 로딩 시간 대신
    Timer(const Duration(milliseconds: 1000), () {
      Navigator.pushNamed(context, '/home');
    });
  }
}
