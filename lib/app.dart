import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_feed_demo/providers/learn_feed_provider.dart';
import 'package:learn_feed_demo/services/route_services.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class LearnFeedDemoApp extends StatelessWidget {
  const LearnFeedDemoApp({Key? key}) : super(key: key);

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LearnFeedProvider>(
      create: (context) => LearnFeedProvider(),
      child: const AppContainer(),
    );
  }
}

class AppContainer extends StatelessWidget {
  const AppContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          DefaultMaterialLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate,
          DefaultWidgetsLocalizations.delegate,
        ],
        routes: AppRoutes.applicationRoutes(context),
        initialRoute: AppRoutes.HOME_ROUTE,
      );
    });
  }
}
