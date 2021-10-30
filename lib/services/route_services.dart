import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_feed_demo/screens/learn_feed/learn_feed.dart';
import 'package:learn_feed_demo/screens/splash/splash_screen.dart';
import 'package:learn_feed_demo/utils/enums.dart';

class AppRoutes {
  /// routes name
  static const String HOME_ROUTE = '/';
  static const String LEARN_FEED_ROUTE = 'learn_feed';

  /// All Application Routes
  static Map<String, WidgetBuilder> applicationRoutes(BuildContext context) {
    return {
      HOME_ROUTE: (context) => const SplashScreen(),
      LEARN_FEED_ROUTE: (context) => const LearnFeedScreen(),
    };
  }

  /// Application Nav
  static navigatePage(
      {required BuildContext context,
      required String pageRoute,
      required PageNav pageNav,
      Object? arguments}) {
    /// only push nav
    if (pageNav == PageNav.push) {
      if (arguments != null) {
        Future.delayed(Duration.zero, () async {
          Navigator.of(context).pushNamed(pageRoute, arguments: arguments);
        });
      } else {
        Future.delayed(Duration.zero, () async {
          Navigator.of(context).pushNamed(pageRoute);
        });
      }
    }

    /// replace nav
    else if (pageNav == PageNav.replace) {
      if (arguments != null) {
        Future.delayed(Duration.zero, () async {
          Navigator.of(context)
              .pushReplacementNamed(pageRoute, arguments: arguments);
        });
      } else {
        Future.delayed(Duration.zero, () async {
          Navigator.of(context).pushReplacementNamed(pageRoute);
        });
      }
    }

    /// push and remove until matched route
    else if (pageNav == PageNav.pushAndRemove) {
      if (arguments != null) {
        Future.delayed(Duration.zero, () async {
          Navigator.of(context).pushNamedAndRemoveUntil(
              pageRoute, (Route<dynamic> route) => false,
              arguments: arguments);
        });
      } else {
        Future.delayed(Duration.zero, () async {
          Navigator.of(context).pushNamedAndRemoveUntil(
              pageRoute, (Route<dynamic> route) => false);
        });
      }
    }

    /// only pop/back
    else {
      Future.delayed(Duration.zero, () async {
        Navigator.of(context).pop();
      });
    }
  }
}
