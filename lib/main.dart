import 'package:flutter/material.dart';
import 'package:training_intervals/features/dashboard/presentation/dashboard_screen.dart';
import 'package:training_intervals/features/intervals/presentation/details_screen.dart';
import 'package:training_intervals/features/intervals/presentation/player_screen.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.light(),
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
