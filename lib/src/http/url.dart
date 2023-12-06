import 'package:flutter/foundation.dart';

String get uriPreffix => kReleaseMode
    ? ''
    : kProfileMode
        ? 'stg.'
        : kDebugMode
            ? 'dev.'
            : '';

String get baseUrl => "${uriPreffix}api.dreampuppy.com.br";
