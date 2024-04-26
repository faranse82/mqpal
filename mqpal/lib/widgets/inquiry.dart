import 'package:flutter/material.dart';
import 'package:mqpal/state.dart';
import 'package:provider/provider.dart';
import 'package:mqpal/screens/inquiry_success.dart';

class Inquiry {
  final String title;
  final String description;
  final String date;
  final String time;

  Inquiry({
    required this.title,
    required this.description,
    required this.date,
    required this.time,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'date': date,
      'time': time,
    };
  }

  factory Inquiry.fromJson(Map<String, dynamic> json) {
    return Inquiry(
      title: json['title'],
      description: json['description'],
      date: json['date'],
      time: json['time'],
    );
  }
}

class NewInquiry extends StatefulWidget {
  const NewInquiry({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NewInquiryState createState() => _NewInquiryState();
}

class _NewInquiryState extends State<NewInquiry> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  Widget buildTextFieldWithLabel(
      String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            label,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        Container(
          width: double.infinity,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  width: 1, color: Theme.of(context).colorScheme.onSurface),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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

  Widget buildDescriptionField(double screenHeight) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'Description',
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        Container(
          height: screenHeight * 0.155,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  width: 1, color: Theme.of(context).colorScheme.onSurface),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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

  Widget buildAboutBox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            'About Inquiries',
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        Text(
          'You may ask about anything as long it is in relation to your studies and experiences on campus! Make sure you provide all relevant details. Keep in mind that your inquiry may be used for training purposes. If you wish for your inquiries to be confidential, ensure that you mention that in your inquiry.\n',
          style: Theme.of(context).textTheme.bodySmall,
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
                backgroundColor: Theme.of(context).colorScheme.onBackground,
                title: const Text('Missing Information'),
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
                backgroundColor: Theme.of(context).colorScheme.onBackground,
                title: const Text('Confirmation'),
                content:
                    const Text('Are you sure you want to submit the question?'),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Close the confirmation dialog
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InquirySuccessScreen(
                            title: _titleController.text,
                            description: _descriptionController.text,
                            dateAndTime: DateTime.now().microsecondsSinceEpoch,
                          ),
                        ),
                      );
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
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.surface,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    style: Theme.of(context).textTheme.displayMedium,
                    'Inquiry Form',
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: screenWidth * 0.35, top: screenHeight * 0.003),
                    child: GestureDetector(
                      onTap: () {
                        Provider.of<StateModel>(context, listen: false)
                            .toggleInquiryForm();
                      },
                      child: Container(
                        width: screenWidth * 0.08,
                        height: screenHeight * 0.04,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/close.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 3,
                color: Theme.of(context).colorScheme.secondary,
              ),
              buildAboutBox(),
              SizedBox(height: screenHeight * 0.01),
              buildTextFieldWithLabel('Title', _titleController),
              SizedBox(height: screenHeight * 0.01),
              buildDescriptionField(screenHeight),
              SizedBox(height: screenHeight * 0.01),
              buildSubmitButton(screenWidth, screenHeight),
              SizedBox(height: screenHeight * 0.01),
            ],
          ),
        ),
      ),
    );
  }
}
