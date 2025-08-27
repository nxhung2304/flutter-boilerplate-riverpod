import 'package:boilerplate_riverpod/shared/widgets/loading/skeleton_loader.dart';
import 'package:flutter/material.dart';

class ExampleSkeletonItem extends StatelessWidget {
  const ExampleSkeletonItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            SkeletonLoader(
              width: 50,
              height: 50,
              borderRadius: BorderRadius.circular(8),
            ),
            const SizedBox(width: 16),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SkeletonLoader(width: 150, height: 16),
                  SizedBox(height: 8),
                  SkeletonLoader(width: 100, height: 14),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
