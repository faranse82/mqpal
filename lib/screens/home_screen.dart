import 'package:flutter/material.dart';
import 'package:mqpal/screens/map_screen.dart';
import 'package:mqpal/screens/submitted_inquiries.dart';
import 'package:mqpal/state.dart';
import 'package:provider/provider.dart';
import 'package:mqpal/widgets/inquiry.dart';

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
          color: Theme.of(context).colorScheme.background,
        ),
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
                      padding: EdgeInsets.only(
                        top: screenHeight * 0.05,
                        left: screenWidth * 0.012,
                      ),
                      child: Text('MQPal',
                          style: Theme.of(context).textTheme.titleLarge),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: screenWidth * 0.026,
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
              left: screenWidth * 0.05,
              top: screenHeight * 0.19,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: screenWidth * 0.9,
                    height: 0.2771 * screenHeight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(screenWidth * 0.02),
                        topRight: Radius.circular(screenWidth * 0.02),
                      ),
                      color: Theme.of(context).colorScheme.surface, //widget
                      border: Border.all(
                        color: Colors.black.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: screenWidth * 0.03,
                            right: screenWidth * 0.016,
                            top: screenHeight * 0.015,
                          ),
                          child: Text(
                            'Lost on campus?',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ),
                        Positioned(
                          left: screenWidth * 0.032,
                          right: screenWidth * 0.032,
                          top: screenHeight * 0.07,
                          child: SizedBox(
                            width: screenWidth * 0.8,
                            height: screenHeight * 0.15,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MapScreen(),
                                  ),
                                );
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
                          left: screenWidth * 0.026,
                          right: screenWidth * 0.026,
                          top: screenHeight * 0.235,
                          child: Text(
                            'Click on the MQU logo to view the map!',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: screenWidth * 0.005,
                        right: screenWidth * 0.005,
                      ),
                      child: Container(
                        width: screenWidth * 0.89,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(screenWidth * 0.02),
                              bottomLeft: Radius.circular(screenWidth * 0.02),
                            ),
                            side: BorderSide(
                              width: 2,
                              strokeAlign: BorderSide.strokeAlignCenter,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // "Inquiries" section
            Positioned(
              left: screenWidth * 0.05,
              top: screenHeight * 0.49,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: screenWidth * 0.9,
                    height: screenHeight * 0.3283,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(screenWidth * 0.02),
                        topRight: Radius.circular(screenWidth * 0.02),
                      ),
                      border: Border.all(
                        color: Colors.black.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: screenWidth * 0.03,
                            right: screenWidth * 0.016,
                            top: screenHeight * 0.015,
                          ),
                          child: Text(
                            'Inquiries',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: screenWidth * 0.03,
                            right: screenWidth * 0.016,
                            top: screenHeight * 0.07,
                          ),
                          child: Text(
                            'Have a question about your studies? Submit and inquiry and we will help you out!',
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
                      ],
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: screenWidth * 0.005,
                        right: screenWidth * 0.005,
                      ),
                      child: Container(
                        width: screenWidth * 0.89,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(screenWidth * 0.02),
                              bottomLeft: Radius.circular(screenWidth * 0.02),
                            ),
                            side: BorderSide(
                              width: 2,
                              strokeAlign: BorderSide.strokeAlignCenter,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
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
                              child: const NewInquiry(),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      // Bottom navigation bar
      bottomNavigationBar: Container(
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
                  builder: (context) => const SubmittedInquiriesScreen(),
                ),
              );
            }, screenHeight, screenWidth),
            _buildNavButton(
                'Home', 'home-page.png', () {}, screenHeight, screenWidth),
            _buildNavButton('Map', 'map.png', () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MapScreen(),
                ),
              );
            }, screenHeight, screenWidth),
          ],
        ),
      ),
    );
  }

  Widget _buildNavButton(String label, String iconUrl, VoidCallback onTap,
      double screenHeight, double screenWidth) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.01),
            Expanded(
              child: Container(
                width: 45,
                height: 35,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/$iconUrl'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Ubuntu',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
