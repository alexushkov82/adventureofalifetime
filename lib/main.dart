import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'src/core/utils.dart';
import 'src/config/router/router.dart';
import 'src/di/di.dart';
import 'src/features/cart/data/services/hive_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencies();
  final hiveService = getIt<HiveService>();
  await hiveService.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    if (isTablet) ...[
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]
  ]);
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
