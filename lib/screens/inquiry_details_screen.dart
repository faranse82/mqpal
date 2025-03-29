import 'package:flutter/material.dart';
import 'package:mqpal/screens/map_screen.dart';
import 'package:mqpal/screens/submitted_inquiries.dart';
import 'package:mqpal/screens/update_inquiry_screen.dart';
import 'package:mqpal/state.dart';
import 'package:mqpal/widgets/inquiry.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

// the screen you see after you submit an inquiry
class InquiryDetailsScreen extends StatelessWidget {
  final Inquiry inquiry;

  const InquiryDetailsScreen({
    super.key,
    required this.inquiry,
  });

  void _cancelInquiry(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.onSurface,
        title: Text(
          'Confirmation',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        content: const Text('Are you sure you want to cancel the inquiry?'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.surface,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: Text(
              'No',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          ElevatedButton(
            // creates an inquiry object and is then sent to the UpdateInquiry function in Staate
            onPressed: () {
              final updatedInquiry = Inquiry(
                title: inquiry.title,
                description: inquiry.description,
                date: inquiry.date,
                time: inquiry.time,
                status: 'Cancelled',
              );

              Provider.of<StateModel>(context, listen: false)
                  .updateInquiry(inquiry, updatedInquiry);

              Provider.of<StateModel>(context, listen: false)
                  .popUpMessage('cancelled', context);

              Navigator.pop(context);
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: Text(
              'Yes',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      //top nav bar
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(9.h),
        child: AppBar(
          leading: IconButton(
            key: const Key('edit_button'),
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).colorScheme.onPrimary,
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
          toolbarHeight: 9.h,
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
              left: 5.w,
              right: 5.w,
              top: 1.5.h,
              bottom: 10.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 90.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(2.w),
                      topRight: Radius.circular(2.w),
                    ),
                    color: Theme.of(context).colorScheme.surface,
                    border: Border.all(
                      color: Colors.black.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 2.w),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.w,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: Text(
                                  'Title: ${inquiry.title}',
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                )),
                                if (inquiry.status != 'Cancelled')
                                  IconButton(
                                    icon: Icon(
                                      Icons.edit,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      size: 25.sp,
                                    ),
                                    //opens update inquiry screen and provides it with the current inquiry
                                    onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            UpdateInquiryScreen(
                                                inquiry: inquiry),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            SizedBox(height: 1.h),
                            Text(
                              'Description',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            SizedBox(height: 1.h),
                            Container(
                              width: 80.w,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 1.6.w, vertical: 1.6.h),
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 1,
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
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
                            SizedBox(height: 1.h),
                            Text(
                              'Submission time: ${inquiry.date} - ${inquiry.time}',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            SizedBox(height: 1.h),
                            Text(
                              'Status: ${inquiry.status}',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            SizedBox(height: 1.h),
                          ],
                        ),
                      ),
                      //bottom coloured part of the block
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 0.4.w,
                            right: 0.4.w,
                          ),
                          child: Container(
                            width: 90.w,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(2.w),
                                  bottomLeft: Radius.circular(2.w),
                                ),
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
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 3.w),

                // shows the cancel button only if the status is not already cancelled.
                if (inquiry.status != 'Cancelled')
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: GestureDetector(
                      onTap: () => _cancelInquiry(context),
                      child: Container(
                        width: 80.w,
                        height: 6.h,
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
                  ),
              ],
            ),
          ),
        ),
      ),

      //Bottom nav bar
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
            }, screenHeight, screenWidth, context),
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
