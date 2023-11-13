import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery/widget.dart';
import 'package:gallery/router.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void main() {
  GetIt.I.registerSingleton<AppRouter>(AppRouter());
  runApp(const AppWidget());
}
