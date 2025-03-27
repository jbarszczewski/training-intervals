import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:training_intervals/features/dashboard/presentation/dashboard_screen.dart';

class LibraryScreen extends StatelessWidget {
  static const String route = '/library';

  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FCard(
          title: const Text('Library'),
          subtitle: const Text('You have 3 unread messages.'),
          child: FButton(
            label: const Text('Read messages'),
            onPress: () => Navigator.pushNamed(context, DashboardScreen.route),
          ),
        ),
      ],
    );
  }
}
