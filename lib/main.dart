import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery/ioc.dart';
import 'package:gallery/widget.dart';
import 'package:gallery/router.dart';


void main() {
  getIt.registerSingleton<AppRouter>(AppRouter());
  runApp(const AppWidget());
}
