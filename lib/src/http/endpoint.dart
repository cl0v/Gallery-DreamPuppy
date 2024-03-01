import 'package:flutter/foundation.dart';

// String get uriPreffix => kReleaseMode
//     ? ''
//     : kProfileMode
//         ? 'stg.'
//         : kDebugMode
//             ? 'dev.'
//             : '';

const uvicorn = "http://localhost:9900";

/// Docker compose
const compose = "http://localhost:8080";

/// Local cloud (Minikube with port-forward)
const cloud = "http://localhost:28015";

const prod = "https://api.dreampuppy.com.br";

String get devEnv => uvicorn;

String get baseUrl => kDebugMode ? devEnv : prod;
