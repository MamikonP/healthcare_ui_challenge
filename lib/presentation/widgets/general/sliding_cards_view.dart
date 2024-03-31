import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../domain/virus/virus_entity.dart';

class SlidingCardsView extends StatefulWidget {
  const SlidingCardsView({super.key});

  @override
  State<SlidingCardsView> createState() => _SlidingCardsViewState();
}

class _SlidingCardsViewState extends State<SlidingCardsView> {
  late PageController pageController;

  List<VirusEntity> demoCardData = [
    VirusEntity(
      name: 'Your Personal Health Partner',
      image: 'health1.png',
    ),
    VirusEntity(
      name: 'Health Made Simple, Always',
      image: 'health2.png',
    ),
    VirusEntity(
      name: 'Healthcare in Your Pocket',
      image: 'health3.png',
    ),
    VirusEntity(
      name: 'Wellness Starts Here, Today',
      image: 'health4.png',
    ),
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.8);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.35,
      child: PageView.builder(
        clipBehavior: Clip.none,
        controller: pageController,
        itemCount: demoCardData.length,
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: pageController,
            builder: (context, child) {
              var pageOffset = 0.0;
              if (pageController.position.haveDimensions) {
                pageOffset = pageController.page! - index;
              }
              final gauss =
                  math.exp(-(math.pow(pageOffset.abs() - 0.5, 2) / 0.08));
              return Transform.translate(
                offset: Offset(-32 * gauss * pageOffset.sign, 0),
                child: Container(
                  margin: const EdgeInsets.only(left: 8, right: 8, bottom: 24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(8, 20),
                        blurRadius: 24,
                      ),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      // Image
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(32)),
                        child: Image.asset(
                          'assets/images/${demoCardData[index].image}',
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: double.infinity,
                          fit: BoxFit.none,
                          alignment: Alignment(pageOffset, 0),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(demoCardData[index].name,
                                style: const TextStyle(fontSize: 20)),
                          ],
                        ),
                      )),
                    ],
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
