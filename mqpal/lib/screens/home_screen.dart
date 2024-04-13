import 'package:flutter/material.dart';

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
    return Scaffold(
      body: Container(
        width: 960,
        height: 1948,
        decoration: const BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            // Top header
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 480,
                height: 120,
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
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: Text('MQPal', style: _textTheme.titleLarge),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 23,
              top: 124,
              child: Text(
                'Hi Faran!',
                textAlign: TextAlign.center,
                style: _textTheme.displayLarge,
              ),
            ),

            // "Need caffeine?" section
            Positioned(
              left: 23,
              right: 23,
              top: 190,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 430,
                    height: 270,
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
                            width: 370,
                            height: 150,
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
                          top: 225,
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
              top: 480,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 430,
                    height: 320,
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
                          padding: const EdgeInsets.only(
                            left: 150,
                            right: 150,
                            top: 240,
                          ),
                          child: Container(
                            width: 180,
                            height: 55,
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
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 316,
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
                width: 480,
                height: 86,
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
