import 'package:flutter/material.dart';
import 'package:meetup/onboarding/models/carrousel_item_model.dart';

class CarrouselWidget extends StatelessWidget {
  final PageController controller;
  final List<CarrouselItemModel> carrousel;
  const CarrouselWidget({
    super.key,
    required this.controller,
    required this.carrousel,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      scrollDirection: Axis.horizontal,
      itemCount: carrousel.length,
      itemBuilder: (_, index) {
        final item = carrousel[index];

        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    height: 245,
                    child: Image.asset(item.image, fit: BoxFit.cover),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    item.subTitle,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(
                        0xFFC9C9C9,
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
