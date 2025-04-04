import 'package:flutter/material.dart';
import 'package:mqpal/state.dart';
import 'package:provider/provider.dart';
import 'package:mqpal/screens/inquiry_success.dart';
import 'package:sizer/sizer.dart';

class Inquiry {
  final String title;
  final String description;
  final String date;
  final String time;
  final String status;

  Inquiry({
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'date': date,
      'time': time,
      'status': status,
    };
  }

  factory Inquiry.fromJson(Map<String, dynamic> json) {
    return Inquiry(
        title: json['title'],
        description: json['description'],
        date: json['date'],
        time: json['time'],
        status: json['status'] ?? 'In progress');
  }
}

class NewInquiry extends StatefulWidget {
  const NewInquiry({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NewInquiryState createState() => _NewInquiryState();
}

class _NewInquiryState extends State<NewInquiry> {
  // input text boxes
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void submitInquiry() {
    final String title = _titleController.text;
    final String description = _descriptionController.text;
    final DateTime now = DateTime.now();
    final String date = '${now.year}-${now.month}-${now.day}';
    final String time = '${now.hour}:${now.minute}';
    const String status = 'In progress';

    final Inquiry inquiry = Inquiry(
      title: title,
      description: description,
      date: date,
      time: time,
      status: status,
    );
    Navigator.pop(context); //close confirmation box
    Provider.of<StateModel>(context, listen: false).addInquiry(inquiry);
    Provider.of<StateModel>(context, listen: false)
        .toggleInquiryForm(); //close the inquiry form

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InquirySuccessScreen(inquiry: inquiry),
      ),
    );
  }

  Widget buildTextFieldWithLabel(String label, TextEditingController controller,
      double screenHeight, double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 3.sp),
          child: Text(
            label,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        Container(
          width: double.infinity,
          height: 7.h,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  width: 1, color: Theme.of(context).colorScheme.onSurface),
              borderRadius: BorderRadius.circular(5.sp),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 3.sp),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Enter your $label',
            ),
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ],
    );
  }

  Widget buildDescriptionField(double screenHeight, double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 3.sp),
          child: Text(
            'Description',
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        Container(
          height: 15.5.h,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  width: 1, color: Theme.of(context).colorScheme.onSurface),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 1.6.h),
          child: TextField(
              controller: _descriptionController,
              maxLines: null,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter your description',
              ),
              style: Theme.of(context).textTheme.bodySmall),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text(
            'Briefly describe your concern',
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
      ],
    );
  }

  Widget buildAboutBox(double screenHeight) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 1.h),
          child: Text(
            'About Inquiries',
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        Text(
          'You may ask about anything as long it is in relation to your studies and experiences on campus! Make sure you provide all relevant details. Keep in mind that your inquiry may be used for training purposes. If you wish for your inquiries to be confidential, ensure that you mention that in your inquiry.\n',
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ],
    );
  }

  Widget buildSubmitButton(double screenWidth, double screenHeight) {
    return Center(
      child: GestureDetector(
        onTap: () {
          if (_titleController.text.isEmpty ||
              _descriptionController.text.isEmpty) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: Theme.of(context).colorScheme.onSurface,
                title: Text(
                  'Missing Information',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                content: const Text(
                    'Please fill out both the title and description fields.'),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Text(
                      'OK',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                ],
              ),
            );
          } else {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: Theme.of(context).colorScheme.onError,
                title: Text(
                  'Confirmation',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                content:
                    const Text('Are you sure you want to submit the question?'),
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
                    onPressed: submitInquiry,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Text(
                      'Yes',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            );
          }
        },
        child: Container(
          height: screenHeight * 0.05,
          width: screenWidth * 0.35,
          decoration: ShapeDecoration(
            color: Theme.of(context).colorScheme.secondary,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
          ),
          child: Center(
            child: Text(
              style: Theme.of(context).textTheme.labelLarge,
              'Submit',
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    //used to set relative sizes for elements

    return Scrollbar(
      radius: Radius.circular(5.sp),
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                ((screenWidth + screenHeight) / 2) * 0.015),
            color: Theme.of(context).colorScheme.surface,
          ),
          child: Padding(
            padding: EdgeInsets.all(((screenWidth + screenHeight) / 2) * 0.021),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: screenHeight * 0.008),
                        child: Text(
                          'Inquiry Form',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Provider.of<StateModel>(context, listen: false)
                            .toggleInquiryForm();
                      },
                      child: SizedBox(
                        width: screenWidth * 0.11,
                        height: screenHeight * 0.04,
                        child: IconButton(
                          icon: Icon(
                            Icons.close,
                            color: Theme.of(context).colorScheme.secondary,
                            size: 26.sp,
                          ),
                          onPressed: () {
                            Provider.of<StateModel>(context, listen: false)
                                .toggleInquiryForm();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(
                  thickness: 3,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                buildAboutBox(screenHeight),
                SizedBox(height: 1.h),
                buildTextFieldWithLabel(
                    'Title', _titleController, screenHeight, screenWidth),
                SizedBox(height: 1.h),
                buildDescriptionField(screenHeight, screenWidth),
                SizedBox(height: 1.h),
                buildSubmitButton(screenWidth, screenHeight),
                SizedBox(height: 1.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
