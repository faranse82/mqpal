import 'package:flutter/material.dart';
import 'package:mqpal/screens/map_screen.dart';
import 'package:mqpal/screens/submitted_inquiries.dart';
import 'package:mqpal/widgets/inquiry.dart';

class InquiryDetailsScreen extends StatelessWidget {
  final Inquiry inquiry;

  const InquiryDetailsScreen({
    super.key,
    required this.inquiry,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.09),
        child: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).colorScheme.error,
              size: 45,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('Inquiry Details',
              style: Theme.of(context).textTheme.titleLarge),
          backgroundColor: Theme.of(context).colorScheme.primary,
          elevation: 0,
          centerTitle: true,
          toolbarHeight: screenHeight * 0.09,
        ),
      ),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
        ),
        child: Stack(
          children: [
            // Inquiry details
            Positioned(
              left: 23,
              right: 23,
              top: screenHeight * 0.015,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: screenWidth * 0.9,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      border: Border.all(
                        color: Colors.black.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: screenWidth * 0.9,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 3,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.05),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Title: ${inquiry.title}',
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              Text(
                                'Description',
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              Container(
                                width: screenWidth * 0.8,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 10),
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 1,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                child: Text(
                                  inquiry.description,
                                  textAlign: TextAlign.justify,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              Text(
                                'Submission time: ${inquiry.date} - ${inquiry.time}',
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              Text(
                                'Status: In progress',
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                              SizedBox(height: screenHeight * 0.02),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  GestureDetector(
                    onTap: () {
                      // implement cancel inquiry
                    },
                    child: Container(
                      width: screenWidth * 0.9,
                      height: screenHeight * 0.06,
                      decoration: ShapeDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Cancel Inquiry',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

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
                    _buildNavButton('Home', 'home-page.png', () {
                      Navigator.popUntil(context, (route) => route.isFirst);
                    }),
                    _buildNavButton('Map', 'map.png', () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MapScreen(),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
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
