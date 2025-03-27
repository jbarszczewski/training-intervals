import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:training_intervals/features/library/presentation/library_screen.dart';

class DashboardScreen extends StatelessWidget {
  static const String route = '/';

  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader(
        title: Text('Dashboard'),
        actions: [
          FHeaderAction(
            icon: FIcon(
              FAssets.icons.bird,
              color: Colors.red,
              size: 24,
              semanticLabel: 'Label',
            ),
            onPress: () {},
          ),
        ],
      ),
      content: Column(
        children: [
          FCard(
            title: const Text('Dashboard sometjing'),
            subtitle: const Text('You have 3 unread messages.'),
            child: FButton(
              label: const Text('Read messages'),
              onPress: () => Navigator.pushNamed(context, LibraryScreen.route),
            ),
          ),
        ],
      ),
      footer: FBottomNavigationBar(
        children: [
          FBottomNavigationBarItem(
            icon: FIcon(FAssets.icons.house),
            label: const Text('Home'),
          ),
          FBottomNavigationBarItem(
            icon: FIcon(FAssets.icons.libraryBig),
            label: const Text('Library'),
          ),
          FBottomNavigationBarItem(
            icon: FIcon(FAssets.icons.cog),
            label: const Text('Settings'),
          ),
        ],
      ),
      contentPad: true,
      resizeToAvoidBottomInset: true,
    );
  }
}
