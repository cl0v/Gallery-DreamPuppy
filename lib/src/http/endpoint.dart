import 'package:flutter/foundation.dart';

String get uriPreffix => kReleaseMode
    ? ''
    : kProfileMode
        ? 'stg.'
        : kDebugMode
            ? 'dev.'
            : '';


const prod = "https://api.dreampuppy.com.br";
const uvicorn = "http://localhost:9900";
const compose = "http://localhost:8080";

String get baseUrl => kDebugMode ? uvicorn :  prod;
