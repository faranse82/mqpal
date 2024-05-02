// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mqpal/screens/map_screen.dart';
import 'package:mqpal/screens/submitted_inquiries.dart';
import 'package:mqpal/state.dart';
import 'package:mqpal/widgets/inquiry.dart';
import 'package:provider/provider.dart';

class UpdateInquiryScreen extends StatefulWidget {
  final Inquiry inquiry;

  const UpdateInquiryScreen({super.key, required this.inquiry});

  @override
  _UpdateInquiryScreenState createState() => _UpdateInquiryScreenState();
}

class _UpdateInquiryScreenState extends State<UpdateInquiryScreen> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.inquiry.title);
    _descriptionController =
        TextEditingController(text: widget.inquiry.description);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _updateInquiry() {
    final String updatedTitle = _titleController.text;
    final String updatedDescription = _descriptionController.text;

    final updatedInquiry = Inquiry(
      title: updatedTitle,
      description: updatedDescription,
      date: widget.inquiry.date,
      time: widget.inquiry.time,
      status: widget.inquiry.status,
    );

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.onError,
        title: Text(
          'Confirmation',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        content: const Text('Are you sure you want to update the question?'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              // Close the confirmation dialog
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
            onPressed: () {
              Provider.of<StateModel>(context, listen: false)
                  .updateInquiry(widget.inquiry, updatedInquiry);

              Provider.of<StateModel>(context, listen: false)
                  .popUpMessage('updated', context);

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
      resizeToAvoidBottomInset: false,
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
          title: Text('Update Inquiry',
              style: Theme.of(context).textTheme.titleLarge),
          backgroundColor: Theme.of(context).colorScheme.primary,
          elevation: 0,
          centerTitle: true,
          toolbarHeight: screenHeight * 0.09,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: screenWidth,
                margin: EdgeInsets.all(screenWidth * 0.05),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: screenHeight * 0.02),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Title',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Container(
                            width: screenWidth * 0.8,
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.016,
                                vertical: screenHeight * 0.010),
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
                            child: TextField(
                              controller: _titleController,
                              style: Theme.of(context).textTheme.bodySmall,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          Text(
                            'Description',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          SizedBox(height: screenHeight * 0.009),
                          Container(
                            width: screenWidth * 0.8,
                            height: screenHeight * 0.35,
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.016,
                                vertical: screenHeight * 0.010),
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
                            child: TextField(
                              controller: _descriptionController,
                              maxLines: null,
                              style: Theme.of(context).textTheme.bodySmall,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: screenWidth * 0.004,
                          right: screenWidth * 0.004,
                        ),
                        child: Container(
                          width: screenWidth * 0.9,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomRight:
                                    Radius.circular(screenWidth * 0.02),
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
              GestureDetector(
                onTap: _updateInquiry,
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
                      'Update',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
            ],
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
            _buildNavButton('Inquiries', 'inquiries.png', () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SubmittedInquiriesScreen(),
                ),
              );
            }, screenHeight, screenWidth),
            _buildNavButton('Home', 'home-page.png', () {
              Navigator.popUntil(context, (route) => route.isFirst);
            }, screenHeight, screenWidth),
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
