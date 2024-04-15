import 'package:flutter/material.dart';
import 'package:mqpal/screens/submitted_inquiries.dart';
import 'package:mqpal/state.dart';
import 'package:provider/provider.dart';
import 'package:mqpal/widgets/inquiry.dart';
import 'package:mqpal/widgets/map.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background), //background
        child: Stack(
          children: [
            // Top header
            Positioned(
              child: Container(
                width: screenWidth,
                height: 0.12 * screenHeight,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary, //top nav
                  border: Border.all(
                    color: Colors.black.withOpacity(0.25),
                    width: 1,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x1E000000),
                      blurRadius: 6,
                      offset: Offset(0, 1),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(top: screenHeight * 0.05, left: 12),
                      child: Text('MQPal',
                          style: Theme.of(context).textTheme.titleLarge),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 23,
              top: screenHeight * 0.124,
              child: Text(
                'Hi Faran!',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),

            Padding(
              padding: EdgeInsets.only(
                  top: screenHeight * 0.056, left: screenWidth * 0.85),
              child: GestureDetector(
                onTap: () {
                  Provider.of<StateModel>(context, listen: false)
                      .toggleDarkMode();
                },
                child: Container(
                  width: 55,
                  height: 55,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/toggleDark.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),

            // "Lost on campus?" section
            Positioned(
              left: 23,
              right: 23,
              top: screenHeight * 0.19,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 430,
                    height: 0.2771 * screenHeight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Theme.of(context).colorScheme.surface, //widget
                      border: Border.all(
                        color: Colors.black.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 10,
                          ),
                          child: Text(
                            'Lost on campus?',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ),
                        Positioned(
                          left: 16,
                          right: 16,
                          top: 70,
                          child: SizedBox(
                            width: screenWidth * 0.8,
                            height: screenHeight * 0.15,
                            child: GestureDetector(
                              onTap: () {
                                Provider.of<StateModel>(context, listen: false)
                                    .toggleMap();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: const DecorationImage(
                                    image: AssetImage('assets/images/mqu.png'),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 16,
                          right: 16,
                          top: screenHeight * 0.235,
                          child: Text(
                            'Click on the MQU logo to view the map!',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 266,
                          ),
                          child: Container(
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 2,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary, //divider bar
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // "Inquiries" section
            Positioned(
              left: 23,
              right: 23,
              top: screenHeight * 0.48,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: screenWidth * 0.9,
                    height: screenHeight * 0.3283,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Theme.of(context).colorScheme.surface,
                      border: Border.all(
                        color: Colors.black.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 10,
                          ),
                          child: Text(
                            'Inquiries',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 70,
                          ),
                          child: Text(
                            'Have a question about your studies?\nSubmit and inquiry and we will help you out!',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: screenWidth * 0.30,
                            right: screenWidth * 0.30,
                            top: screenHeight * 0.24,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Provider.of<StateModel>(context, listen: false)
                                  .toggleInquiryForm();
                            },
                            child: Container(
                              width: screenWidth * 0.5,
                              height: screenHeight * 0.05,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.secondary,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  'Ask MQPal',
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: screenHeight * 0.324,
                          ),
                          child: Container(
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: BorderSide(
                                  width: 2,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Bottom navigation bar
            Positioned(
              left: 0,
              bottom: 0,
              child: Container(
                width: screenWidth,
                height: screenHeight * 0.087,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  border: Border.all(
                    color: Colors.black.withOpacity(0.25),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.primary,
                      blurRadius: 6,
                      offset: const Offset(0, -1),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildNavButton('Inquiries', 'inquiries.png', () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const SubmittedInquiriesScreen(),
                        ),
                      );
                    }),
                    _buildNavButton('Home', 'home-page.png', () {}),
                    _buildNavButton('Map', 'map.png', () {
                      Provider.of<StateModel>(context, listen: false)
                          .toggleMap();
                    }),
                  ],
                ),
              ),
            ),
            Consumer<StateModel>(
              builder: (context, expandedProvider, _) {
                return Visibility(
                  visible: expandedProvider.isExpanded,
                  child: Positioned.fill(
                    child: Container(
                      color: Colors.black.withOpacity(0.6),
                      child: Center(
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            double containerWidth = screenWidth * 0.93;
                            double containerHeight = screenHeight * 0.741;

                            return Container(
                              width: containerWidth,
                              height: containerHeight,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.background,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const SingleChildScrollView(
                                child: NewInquiry(),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            Consumer<StateModel>(builder: (context, mapProvider, _) {
              return Visibility(
                visible: mapProvider.isMapOpen,
                child: Positioned.fill(
                  child: Container(
                    color: Colors.black.withOpacity(0.6),
                    child: Center(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          double containerWidth = screenWidth * 0.95;
                          double containerHeight = screenHeight * 0.424;
                          return Container(
                            width: containerWidth,
                            height: containerHeight,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const SingleChildScrollView(
                              child: Map(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildNavButton(String label, String iconUrl, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 55,
            height: 45,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/$iconUrl'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Ubuntu',
            ),
          ),
        ],
      ),
    );
  }
}
