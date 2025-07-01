import 'package:harry_final/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(HarryPotter(appRouter: AppRouter()));
}

class HarryPotter extends StatelessWidget {
  final AppRouter appRouter;

  const HarryPotter({super.key, required this.appRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
