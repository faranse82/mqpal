import 'package:flutter/material.dart';
import 'package:mqpal/screens/home_screen.dart';
import 'package:mqpal/screens/map_screen.dart';
import 'package:mqpal/screens/submitted_inquiries.dart';
import 'package:mqpal/screens/update_inquiry_screen.dart';
import 'package:mqpal/state.dart';
import 'package:mqpal/widgets/inquiry.dart';
import 'package:provider/provider.dart';

class InquirySuccessScreen extends StatelessWidget {
  final Inquiry inquiry;

  const InquirySuccessScreen({
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
          title:
              Text('Ask MQPal!', style: Theme.of(context).textTheme.titleLarge),
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
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.03),
            Container(
              width: screenWidth * 0.9,
              padding: const EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.black.withOpacity(0.2),
                  width: 1,
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Success!',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                    child: Text(
                      'Your inquiry has been successfully submitted. You will get an email from one of our staff within the next 1 - 3 business days.',
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
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
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Container(
              width: screenWidth * 0.9,
              decoration: ShapeDecoration(
                color: Theme.of(context).colorScheme.surface,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: Colors.black.withOpacity(0.2),
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Inquiry Details',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: screenWidth * 0.22),
                          child: Positioned(
                            child: IconButton(
                              icon: Icon(
                                Icons.edit,
                                size: 40,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        UpdateInquiryScreen(inquiry: inquiry),
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: screenWidth * 0.9,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 2,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.4),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Title: ${inquiry.title}',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Text(
                          'Description',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Container(
                          height: screenHeight * 0.2,
                          width: screenWidth * 0.9,
                          padding: const EdgeInsets.all(16.0),
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1,
                                  color:
                                      Theme.of(context).colorScheme.onSurface),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: SingleChildScrollView(
                            child: Text(
                              inquiry.description,
                              textAlign: TextAlign.justify,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Text(
                            'Date and time submitted: \n  - ${inquiry.time}, ${inquiry.date}',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: GestureDetector(
                onTap: () {
                  Provider.of<StateModel>(context, listen: false)
                      .addInquiry(inquiry);

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                child: Container(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.06,
                  decoration: ShapeDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3)),
                  ),
                  child: Center(
                    child: Text(
                      'Return Home',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Positioned(
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
                    builder: (context) => const SubmittedInquiriesScreen(),
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
