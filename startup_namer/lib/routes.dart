import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/demo.dart';
import 'pages/testapp.dart';
import 'pages/randomWords.dart';
import 'pages/userInfo.dart';
import 'application.dart';
import 'pages/login.dart';
import 'pages/list.dart';

var rootHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new Home();
});
var demoRouteHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new Demo();
});
var loginRouteHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new Login();
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
  // Application.state.getUserInfo();
  String id = params["id"]?.first;
  return UserInfo(
    id: id,
  );
});
var userListInfoRouteHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return UserList();
});

class Routes {
  static String root = "/";
  static String routeNameLogin = "/login";
  static String routeNameDemo = "/demo";
  static String routeNameTestApp = "/testapp";
  static String routeNameRandomWords = "/randomwords";
  static String routeNameUserInfo = '/users/:id';
  static String routeNameUserList = '/user/list';

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
    });
    router.define(root, handler: rootHandler);
    router.define(routeNameDemo, handler: demoRouteHandler);
    router.define(routeNameLogin, handler: loginRouteHandler);
    router.define(routeNameTestApp,
        handler: testAppRouteHandler,
        transitionType: TransitionType.inFromLeft);
    router.define(routeNameRandomWords,
        handler: randomWordsRouteHandler,
        transitionType: TransitionType.inFromRight);
    router.define(routeNameUserInfo,
        handler: userInfoRouteHandler,
        transitionType: TransitionType.inFromLeft);
    router.define(routeNameUserList,
        handler: userListInfoRouteHandler,
        transitionType: TransitionType.inFromLeft);
  }
}
