import 'package:flutter/foundation.dart';

// String get uriPreffix => kReleaseMode
//     ? ''
//     : kProfileMode
//         ? 'stg.'
//         : kDebugMode
//             ? 'dev.'
//             : '';

const uvicorn = "http://localhost:9900";
const uvicorn2 = "http://localhost:9901";

/// Docker compose
const compose = "http://localhost:8080";

/// Local cloud (Minikube with port-forward)
const cloud = "http://localhost:28015";

const prod = "https://api.dreampuppy.com.br";

String get devEnv => prod;

String get baseUrl => kDebugMode ? devEnv : prod;
