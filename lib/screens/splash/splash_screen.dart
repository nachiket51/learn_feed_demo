import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:learn_feed_demo/services/route_services.dart';
import 'package:learn_feed_demo/utils/enums.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => AppRoutes.navigatePage(
            context: context,
            pageRoute: AppRoutes.LEARN_FEED_ROUTE,
            pageNav: PageNav.pushAndRemove));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterLogo(size: MediaQuery.of(context).size.height),
    );
  }
}
