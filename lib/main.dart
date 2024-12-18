import 'package:bocchi_guitar_hub_client/core/init/hive_initializer.dart';
import 'package:bocchi_guitar_hub_client/presentation/router/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveInitializer.init();

  runApp(const ProviderScope(
    child: MyApp(),
  ));
}
