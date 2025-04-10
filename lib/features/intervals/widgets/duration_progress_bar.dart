import 'package:flutter/material.dart';

class DurationProgressBar extends StatelessWidget {
  final int currentDuration;
  final int totalDuration;

  const DurationProgressBar({
    super.key,
    required this.currentDuration,
    required this.totalDuration,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = constraints.biggest.shortestSide * 0.6;
        return Center(
          child: SizedBox(
            width: size,
            height: size,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Stack(
                fit: StackFit.expand,
                alignment: Alignment.center,
                children: [
                  CircularProgressIndicator(
                    value: currentDuration / totalDuration,
                    backgroundColor: Colors.grey[300],
                    color: Colors.blue,
                    strokeWidth: 24.0,
                  ),
                  Center(
                    child: Text(
                      '$currentDuration / $totalDuration s',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
