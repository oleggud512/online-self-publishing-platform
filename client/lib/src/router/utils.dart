import 'package:go_router/go_router.dart';

String getCurrentLocation(GoRouter router) {
  final RouteMatch lastMatch = router.routerDelegate.currentConfiguration.last;
  final RouteMatchList matchList = lastMatch is ImperativeRouteMatch 
    ? lastMatch.matches 
    : router.routerDelegate.currentConfiguration;
  final String location = matchList.uri.toString();
  return location;
}