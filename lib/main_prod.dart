import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app/nearo_app.dart';
import 'bootstrap.dart';

// flutter run -t lib/main_prod.dart --flavor prod
// flutter build apk -t lib/main_prod.dart --flavor prod
void main() async {
  await bootstrap(environment: 'prod');
  runApp(const ProviderScope(child: NearoApp()));
}
