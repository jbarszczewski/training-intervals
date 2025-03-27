import 'package:flutter/material.dart';
import 'package:training_intervals/features/dashboard/presentation/widgets/interval_card.dart';

class DashboardScreen extends StatelessWidget {
  static const String route = '/';

  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.amber,
              size: 24,
              semanticLabel: 'Settings',
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          final routes = [
            "/intervals/123",
            "/intervals/1",
            "/intervals/12",
            "/intervals/3",
            "/intervals/23",
          ];
          return Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: IntervalCard(
              title: 'Dashboard sometjing',
              onPressed: () => Navigator.pushNamed(context, routes[index]),
            ),
          );
        },
      ),
    );
  }
}
