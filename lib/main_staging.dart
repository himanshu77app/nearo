import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app/nearo_app.dart';
import 'bootstrap.dart';

// flutter run -t lib/main_staging.dart --flavor staging
void main() async {
  await bootstrap(environment: 'staging');
  runApp(const ProviderScope(child: NearoApp()));
}
