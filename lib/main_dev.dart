import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app/nearo_app.dart';
import 'bootstrap.dart';

// flutter run -t lib/main_dev.dart --flavor dev
void main() async {
  await bootstrap(environment: 'dev');
  runApp(const ProviderScope(child: NearoApp()));
}
