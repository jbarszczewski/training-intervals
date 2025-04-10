import 'package:flutter/material.dart';
import 'package:training_intervals/features/dashboard/managers/dashboard_manager.dart';

import '../../../config/service_locator.dart';
import 'interval_card.dart';

class DashboardScreen extends StatelessWidget {
  static const String route = '/';

  final DashboardManager _dashboardManager = getIt<DashboardManager>();

  DashboardScreen({super.key});

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
      body: ListenableBuilder(
        listenable: _dashboardManager,
        builder: (context, _) {
          return ListView.builder(
            itemCount: _dashboardManager.intervals.length,
            itemBuilder: (context, index) {
              final interval = _dashboardManager.intervals[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: IntervalCard(
                  title: interval.title,
                  onPressed:
                      () => Navigator.pushNamed(
                        context,
                        "/intervals/${interval.id}",
                      ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
