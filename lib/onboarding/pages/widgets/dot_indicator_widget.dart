import 'package:flutter/material.dart';
import 'package:meetup/onboarding/models/carrousel_item_model.dart';

class DotIndicatorWidget extends StatelessWidget {
  final Function(int) onTap;
  final int index;
  final List<CarrouselItemModel> items;

  const DotIndicatorWidget({
    super.key,
    required this.onTap,
    required this.index,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: items
          .map(
            (e) => GestureDetector(
              onTap: () {
                onTap(e.index);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: index == e.index
                        ? const Color(0xFFC9C9C9)
                        : const Color(0xFF46A5C3),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
