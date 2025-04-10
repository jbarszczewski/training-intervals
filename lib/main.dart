import 'package:flutter/material.dart';
import 'package:training_intervals/features/dashboard/widgets/dashboard_screen.dart';
import 'package:training_intervals/features/intervals/widgets/details_screen.dart';
import 'package:training_intervals/features/intervals/widgets/player_screen.dart';

import 'config/service_locator.dart';

void main() {
  // Register dependencies
  registerDependencies();
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.light(),
    darkTheme: ThemeData.dark(),
    themeMode: ThemeMode.system,
    onGenerateRoute: (settings) {
      // Handle '/'
      if (settings.name == '/') {
        return MaterialPageRoute(builder: (context) => DashboardScreen());
      }

      var uri = Uri.parse(settings.name!);

      // Handle '/intervals/:id'
      if (uri.pathSegments.length == 2 &&
          uri.pathSegments.first == 'intervals') {
        var id = uri.pathSegments[1];
        return MaterialPageRoute(builder: (context) => DetailsScreen(id: id));
      }

      // Handle '/intervals/:id/play'
      if (uri.pathSegments.length == 3 &&
          uri.pathSegments.first == 'intervals' &&
          uri.pathSegments[2] == 'play') {
        var id = uri.pathSegments[1];
        return MaterialPageRoute(builder: (context) => PlayerScreen(id: id));
      }

      return MaterialPageRoute(builder: (context) => UnknownScreen());
    },
  );
}

class UnknownScreen extends StatelessWidget {
  const UnknownScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Unknown Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Unknown Screen'),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/'),
              child: const Text('Go to Dashboard'),
            ),
          ],
        ),
      ),
    );
  }
}
