import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplete/core/components/card/not_found_navigation.dart';
import 'package:fluttermvvmtemplete/core/constants/navigation/navigation_constants.dart';
import 'package:fluttermvvmtemplete/view/authenticate/test/view/test_view.dart';

class NavigationRoute {
  static NavigationRoute? _instance;

  static NavigationRoute get instance {
    _instance = NavigationRoute._init();
    return _instance!;
  }
  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args)
  {
    switch(args.name)
    {
      case NavigationConstants.TEST_VIEW:
        return normalNavigate(TestView());
      default:
        return MaterialPageRoute(builder:(context)=> NotFoundNavigationWidget()
        );
    }
  }
  MaterialPageRoute normalNavigate(Widget widget)
  {
    return MaterialPageRoute(builder:(context)=>widget);
  }

}