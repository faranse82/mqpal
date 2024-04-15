import 'package:flutter/material.dart';
import 'package:mqpal/screens/home_screen.dart';
import 'package:mqpal/screens/submitted_inquiries.dart';
import 'package:mqpal/state.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InquirySuccessScreen extends StatelessWidget {
  final String title;
  final String description;
  final int dateAndTime;

  const InquirySuccessScreen(
      {super.key,
      required this.title,
      required this.description,
      required this.dateAndTime});

  Future<void> saveInquiryInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final inquiries = prefs.getStringList('inquiries') ?? [];
    final dateFormat = DateFormat('dd/MM/yyyy');
    final timeFormat = DateFormat('hh:mm a');
    final String formattedDate =
        dateFormat.format(DateTime.fromMicrosecondsSinceEpoch(dateAndTime));
    final String formattedTime =
        timeFormat.format(DateTime.fromMicrosecondsSinceEpoch(dateAndTime));
    final inquiry = '$title|||$description|||$formattedDate|||$formattedTime';
    inquiries.add(inquiry);

    await prefs.setStringList('inquiries', inquiries);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final dateFormat = DateFormat('dd/MM/yyyy');
    final timeFormat = DateFormat('hh:mm a');
    final String formattedDate =
        dateFormat.format(DateTime.fromMicrosecondsSinceEpoch(dateAndTime));
    final String formattedTime =
        timeFormat.format(DateTime.fromMicrosecondsSinceEpoch(dateAndTime));
    saveInquiryInfo();
    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
        ),
        child: Column(
          children: [
            Container(
              width: screenWidth,
              height: screenHeight * 0.12,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.05),
                    child: Text(
                      'Ask MQPal!',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ],
              ),
            ),
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
                    child: Text(
                      'Inquiry Details',
                      style: Theme.of(context).textTheme.displayMedium,
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
                          'Title: $title',
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
                              description,
                              textAlign: TextAlign.justify,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Text(
                            'Date and time submitted: \n  - $formattedTime, $formattedDate',
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
                  final inquiry =
                      '$title|||$description|||$formattedDate|||$formattedTime';
                  Provider.of<StateModel>(context, listen: false)
                      .addInquiry(inquiry);

                  Provider.of<StateModel>(context, listen: false)
                      .toggleInquiryForm();

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
      bottomNavigationBar: Container(
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
            _buildNavButton('Inquiries', 'inquiries.png', () {}),
            _buildNavButton('Home', 'home-page.png', () {}),
            _buildNavButton('Map', 'map.png', () {
              Provider.of<StateModel>(context, listen: false).toggleMap();
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
