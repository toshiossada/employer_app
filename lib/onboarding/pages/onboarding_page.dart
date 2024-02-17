import 'package:flutter/material.dart';

import '../../jobs/pages/home_page.dart';
import '../../shared/widgets/custom_button_widget.dart';
import '../models/carrousel_item_model.dart';
import 'widgets/carrousel_widget.dart';
import 'widgets/dot_indicator_widget.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final carrousel = [
    CarrouselItemModel(
      index: 0,
      image: 'assets/images/splash1.png',
      title: 'Procurando um novo emprego',
      subTitle:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    ),
    CarrouselItemModel(
      index: 1,
      image: 'assets/images/splash2.png',
      title: 'Quer divulgar uma vaga?',
      subTitle:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    ),
    CarrouselItemModel(
      index: 2,
      image: 'assets/images/splash3.png',
      title: 'Voce esta no lugar certo!!!',
      subTitle:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    ),
  ];

  final controller = PageController(
    initialPage: 0,
  );

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (_currentPage == controller.page!.round()) return;
      setState(() {
        _currentPage = controller.page!.round();
        controller.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: CarrouselWidget(
              controller: controller,
              carrousel: carrousel,
            ),
          ),
          DotIndicatorWidget(
            onTap: (index) {
              controller.animateToPage(
                index,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
              );
            },
            index: _currentPage,
            items: carrousel,
          ),
          const SizedBox(
            height: 100,
          ),
          CustomButtonWidget(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const HomePage(),
              ));
            },
            label: 'Explore Agora',
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
