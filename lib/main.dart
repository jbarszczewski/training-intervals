import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:training_intervals/features/dashboard/presentation/dashboard_screen.dart';
import 'package:training_intervals/features/library/presentation/library_screen.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    initialRoute: DashboardScreen.route,
    routes: {
      DashboardScreen.route: (_) => const DashboardScreen(),
      LibraryScreen.route: (_) => const LibraryScreen(),
    },
    debugShowCheckedModeBanner: false,
    builder:
        (context, child) => FTheme(data: FThemes.zinc.light, child: child!),
  );
}
