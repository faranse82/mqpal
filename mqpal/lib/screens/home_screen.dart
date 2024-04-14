import 'package:flutter/material.dart';
import 'package:mqpal/state.dart';
import 'package:provider/provider.dart';
import 'package:mqpal/widgets/inquiry.dart';
import 'package:mqpal/widgets/map.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const _textTheme = TextTheme(
    displayLarge: TextStyle(
      color: Colors.black,
      fontSize: 50,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w400,
    ),
    displayMedium: TextStyle(
      color: Colors.black,
      fontSize: 36,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w400,
    ),
    bodyLarge: TextStyle(
      color: Colors.black,
      fontSize: 30,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      color: Color.fromARGB(255, 0, 0, 0),
      fontSize: 26,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w400,
    ),
    labelMedium: TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w400,
    ),
    labelLarge: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w400,
    ),
    titleLarge: TextStyle(
      color: Colors.white,
      fontSize: 50,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w400,
    ),
  );

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: const BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            // Top header
            Positioned(
              child: Container(
                width: screenWidth,
                height: 0.12 * screenHeight,
                decoration: BoxDecoration(
                  color: const Color(0xFFA6192E),
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
                      child: Text('MQPal', style: _textTheme.titleLarge),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: screenHeight * 0.056, left: screenWidth * 0.5),
                      child: GestureDetector(
                        onTap: () {
                          Provider.of<StateModel>(context, listen: false)
                              .toggleMap();
                        },
                        child: Container(
                          width: 55,
                          height: 55,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/map.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
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
                style: _textTheme.displayLarge,
              ),
            ),

            // "Need caffeine?" section
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
                      color: const Color(0xFFDEE2E6),
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
                            'Need caffeine?',
                            style: _textTheme.displayMedium,
                          ),
                        ),
                        Positioned(
                          left: 16,
                          right: 16,
                          top: 70,
                          child: Container(
                            width: screenWidth * 0.8,
                            height: screenHeight * 0.15,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage('assets/images/coffee.png'),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 16,
                          right: 16,
                          top: screenHeight * 0.225,
                          child: Text(
                            'St Laurent Coffee',
                            style: _textTheme.bodyMedium,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 266,
                          ),
                          child: Container(
                            decoration: const ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 2,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                  color: Color(0xFFA6192E),
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
                      color: const Color(0xFFDEE2E6),
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
                            style: _textTheme.displayMedium,
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
                            style: _textTheme.bodyMedium,
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
                                  .toggleExpanded();
                            },
                            child: Container(
                              width: screenWidth * 0.5,
                              height: screenHeight * 0.05,
                              decoration: BoxDecoration(
                                color: const Color(0xFFA6192E),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Center(
                                child: Text(
                                  'Ask MQPal',
                                  style: _textTheme.labelLarge,
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
                            decoration: const ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 2,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                  color: Color(0xFFA6192E),
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
                  color: const Color(0xFFA31313),
                  border: Border.all(
                    color: Colors.black.withOpacity(0.25),
                    width: 1,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x1E000000),
                      blurRadius: 6,
                      offset: Offset(0, -1),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildNavButton('Inquiries', 'inquiries.png'),
                    _buildNavButton('Home', 'home-page.png'),
                    _buildNavButton('Orders', 'orders.png'),
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
                                color: Colors.white,
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
                          double containerHeight = screenHeight * 0.308;
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

  Widget _buildNavButton(String label, String iconUrl) {
    return Column(
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
    );
  }
}
