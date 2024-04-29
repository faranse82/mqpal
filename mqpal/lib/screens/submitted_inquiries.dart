import 'package:flutter/material.dart';
import 'package:mqpal/screens/inquiry_details_screen.dart';
import 'package:mqpal/screens/map_screen.dart';
import 'package:mqpal/state.dart';
import 'package:provider/provider.dart';

class SubmittedInquiriesScreen extends StatelessWidget {
  const SubmittedInquiriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final inquiries = Provider.of<StateModel>(context).inquiries;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.09),
        child: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).colorScheme.onPrimary,
              size: 45,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('Inquiries', style: Theme.of(context).textTheme.titleLarge),
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
            // Past inquiries section
            Positioned(
              left: 23,
              right: 23,
              top: screenHeight * 0.015,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Past inquiries',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Container(
                    width: screenWidth * 0.9,
                    height: screenHeight * 0.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Theme.of(context).colorScheme.surface,
                      border: Border.all(
                        color: Colors.black.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: inquiries.isEmpty
                        ? Center(
                            child: Text(
                              'No inquiries found',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          )
                        : ListView.builder(
                            itemCount: inquiries.length,
                            itemBuilder: (context, index) {
                              final inquiry = inquiries[index];

                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          InquiryDetailsScreen(inquiry: inquiry),
                                    ),
                                  );
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      top: 16, left: 16, right: 16),
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).colorScheme.background,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: Theme.of(context).colorScheme.onSurface,
                                      width: 1,
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Inquiry ${index + 1}',
                                        style:
                                            Theme.of(context).textTheme.displaySmall,
                                      ),
                                      SizedBox(height: screenHeight * 0.01),
                                      Text(
                                        '${inquiry.status} - ${inquiry.date}, ${inquiry.time}',
                                        style: Theme.of(context).textTheme.bodySmall,
                                      ),
                                      SizedBox(height: screenHeight * 0.01),
                                      Text(
                                        inquiry.title,
                                        style: Theme.of(context).textTheme.bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
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