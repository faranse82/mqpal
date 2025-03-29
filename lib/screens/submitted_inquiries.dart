import 'package:flutter/material.dart';
import 'package:mqpal/screens/inquiry_details_screen.dart';
import 'package:mqpal/screens/map_screen.dart';
import 'package:mqpal/state.dart';
import 'package:mqpal/widgets/inquiry.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class SubmittedInquiriesScreen extends StatelessWidget {
  const SubmittedInquiriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //used to set relative sizes for elements

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // array of inquiries
    final inquiries = Provider.of<StateModel>(context).inquiries;

    //splitting them based on whether they are in progress or not
    final inProgressInquiries =
        inquiries.where((inquiry) => inquiry.status == 'In progress').toList();
    final completedInquiries =
        inquiries.where((inquiry) => inquiry.status != 'In progress').toList();

    return Scaffold(
      //top bar
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
          title:
              Text('Inquiries', style: Theme.of(context).textTheme.titleLarge),
          backgroundColor: Theme.of(context).colorScheme.primary,
          elevation: 0,
          centerTitle: true,
          toolbarHeight: screenHeight * 0.09,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
          ),
          child: Padding(
            padding: EdgeInsets.only(
              top: screenHeight * 0.015,
              left: screenWidth * 0.05,
              right: screenWidth * 0.05,
              bottom: screenHeight * 0.1,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'In Progress',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                SizedBox(height: screenHeight * 0.02),
                _buildInquiriesList(context, inProgressInquiries),
                SizedBox(height: screenHeight * 0.04),
                Text(
                  'Completed',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                SizedBox(height: screenHeight * 0.02),
                _buildInquiriesList(context, completedInquiries),
              ],
            ),
          ),
        ),
      ),
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
            _buildNavButton('Inquiries', 'inquiries.png', () {}, screenHeight,
                screenWidth, context),
            _buildNavButton('Home', 'home-page.png', () {
              Navigator.popUntil(context, (route) => route.isFirst);
            }, screenHeight, screenWidth, context),
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

  Widget _buildInquiriesList(BuildContext context, List<Inquiry> inquiries) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).colorScheme.surface,
        border: Border.all(
          color: Colors.black.withOpacity(0.2),
          width: 1,
        ),
      ),

      // checks if the inquiries list is empty, if yes, feedback is given to the user that there are no inquiries
      child: inquiries.isEmpty
          ? Padding(
              padding: EdgeInsets.all((screenHeight + screenWidth) * 0.011),
              child: Text(
                'No inquiries found',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            )
          : ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: inquiries.length,
              itemBuilder: (context, index) {
                final inquiry = inquiries[index];

                return GestureDetector(
                  onTap: () {
                    //takes user to the clicked on inquiry
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            InquiryDetailsScreen(inquiry: inquiry),
                      ),
                    );
                  },
                  child: Container(
                    margin:
                        EdgeInsets.all((screenHeight + screenWidth) * 0.011),
                    padding:
                        EdgeInsets.all((screenHeight + screenWidth) * 0.011),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
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
                          style: Theme.of(context).textTheme.displaySmall,
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
    );
  }

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
