import 'package:flutter/cupertino.dart';
import 'package:fluttermvvmtemplete/core/init/navigation/INavigationService.dart';

class NavigationService implements INavigatorService
{
  static final NavigationService _instance = NavigationService._init();
  static NavigationService get instance => _instance;

  // static NavigationService? _instance;
  // static NavigationService get instance{
  //   _instance=NavigationService._init();
  //   return _instance!;
  // }
  NavigationService._init();
  GlobalKey<NavigatorState> navigatorKey=GlobalKey();
  final removeAllOldRoutes = (Route<dynamic> route)=>false;

  @override
  Future<void> navigateToPage({String? path, Object? data})async {
     await navigatorKey.currentState!.pushNamed(path!,arguments: data);
  }

  @override
  Future<void> navigateToPageClear({String? path, Object? data})async {
    await navigatorKey.currentState!.pushNamedAndRemoveUntil(path!,removeAllOldRoutes,arguments: data);
  }

}