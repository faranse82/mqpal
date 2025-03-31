import 'package:flutter/material.dart';
import 'package:mqpal/screens/map_screen.dart';
import 'package:mqpal/screens/submitted_inquiries.dart';
import 'package:mqpal/state.dart';
import 'package:mqpal/widgets/inquiry.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //used to set relative sizes for elements
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSurface,
        ),
        child: Stack(
          children: [
            // Top header
            Positioned(
              child: Container(
                width: screenWidth,
                height: 12.h,
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
                        top: 5.h,
                        left: 1.2.w,
                      ),
                      child: Text('MQPal',
                          style: Theme.of(context).textTheme.titleLarge),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 2.6.w,
              top: 12.4.h,
              child:
                  Text('Hi!', style: Theme.of(context).textTheme.displayMedium),
            ),

            //dark mode button
            Padding(
              padding: EdgeInsets.only(top: 5.6.h, left: 86.w),
              child: GestureDetector(
                onTap: () {
                  Provider.of<StateModel>(context, listen: false)
                      .toggleDarkMode();
                },
                child: Container(
                  width: 26.sp,
                  height: 26.sp,
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
                    width: 90.w,
                    height: 27.71.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(2.w),
                        topRight: Radius.circular(2.w),
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
                            left: 3.w,
                            right: 1.6.w,
                            top: 1.5.h,
                          ),
                          child: Text(
                            'Lost on campus?',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ),
                        //map widget
                        Positioned(
                          left: 3.2.w,
                          right: 3.2.w,
                          top: 7.h,
                          child: SizedBox(
                            width: 80.w,
                            height: 15.h,
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
                          left: 2.6.w,
                          right: 2.6.w,
                          top: 23.5.h,
                          child: Text(
                            'Click on the MQU logo to view the map!',
                          ),
                        ),
                      ],
                    ),
                  ),

                  // the bottom part of the block
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 0.5.w,
                        right: 0.5.w,
                      ),
                      child: Container(
                        width: 89.w,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(2.w),
                              bottomLeft: Radius.circular(2.w),
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
              left: 5.w,
              top: 49.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 90.w,
                    height: 32.83.h,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(2.w),
                        topRight: Radius.circular(2.w),
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
                            left: 3.w,
                            right: 7.w,
                            top: 2.h,
                          ),
                          child: Text(
                            'Inquiries',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 3.w,
                            right: 1.6.w,
                            top: 7.h,
                          ),
                          child: Text(
                            'Have a question about your studies? Submit an inquiry and we will help you out!',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),

                        //inquiry submission button
                        Padding(
                          padding: EdgeInsets.only(
                            left: 30.w,
                            right: 30.w,
                            top: 24.h,
                          ),
                          child: GestureDetector(
                            key: const Key('inquiry-form'),
                            onTap: () {
                              Provider.of<StateModel>(context, listen: false)
                                  .toggleInquiryForm();
                            },
                            child: Container(
                              width: 50.w,
                              height: 5.h,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.secondary,
                                borderRadius: BorderRadius.circular(4.sp),
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

                  // the bottom part of the block
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 0.5.w,
                        right: 0.5.w,
                      ),
                      child: Container(
                        width: 89.w,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(2.w),
                              bottomLeft: Radius.circular(2.w),
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

            //inquiry form
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
                            double containerWidth = 93.w;
                            double containerHeight = 74.1.h;

                            return Container(
                              width: containerWidth,
                              height: containerHeight,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.surface,
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
        height: 8.7.h,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          border: Border.all(
            color: Colors.black.withOpacity(0.25),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.primary,
              blurRadius: 6.sp,
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
            }, screenHeight, screenWidth, context),
            _buildNavButton('Home', 'home-page.png', () {}, screenHeight,
                screenWidth, context),
            _buildNavButton('Map', 'map.png', () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MapScreen(),
                ),
              );
            }, screenHeight, screenWidth, context),
          ],
        ),
      ),
    );
  }

  // builds each navbar button
  Widget _buildNavButton(String label, String iconUrl, VoidCallback onTap,
      double screenHeight, double screenWidth, BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.01),
            Expanded(
              child: Container(
                width: 40.w,
                height: 30.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/$iconUrl'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Expanded(
              child:
                  Text(label, style: Theme.of(context).textTheme.labelMedium),
            ),
          ],
        ),
      ),
    );
  }
}
