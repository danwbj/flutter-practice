import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/demo.dart';
import 'pages/testapp.dart';
import 'pages/randomWords.dart';
import 'pages/userInfo.dart';
import 'application.dart';

var rootHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new Home();
});
var demoRouteHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new Demo();
});
var testAppRouteHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String message = params["message"]?.first;
  print(message);
  return new TestApp(
    message: message,
  );
});
var randomWordsRouteHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new RandomWords();
});

var userInfoRouteHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  Application.state.getUserInfo();
  String id = params["id"]?.first;
  return UserInfo(
    id: id,
  );
});

class Routes {
  static String root = "/";
  static String routeNameDemo = "/demo";
  static String routeNameTestApp = "/testapp";
  static String routeNameRandomWords = "/randomwords";
  static String routeNameUserInfo = '/users/:id';

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
    });
    router.define(root, handler: rootHandler);
    router.define(routeNameDemo, handler: demoRouteHandler);
    router.define(routeNameTestApp,
        handler: testAppRouteHandler,
        transitionType: TransitionType.inFromLeft);
    router.define(routeNameRandomWords,
        handler: randomWordsRouteHandler,
        transitionType: TransitionType.inFromRight);
    router.define(routeNameUserInfo,
        handler: userInfoRouteHandler,
        transitionType: TransitionType.inFromLeft);
  }
}
