import 'package:flutter/material.dart';

class JobsTags extends StatelessWidget {
  final List<String> tags;

  const JobsTags({
    super.key,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: tags
            .map(
              (tag) => Chip(
                label: Text(tag),
                backgroundColor: Colors.grey,
              ),
            )
            .toList(),
      ),
    );
  }
}
