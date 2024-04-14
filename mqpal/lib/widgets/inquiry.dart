import 'package:flutter/material.dart';

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
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Ubuntu',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0xFF939393)),
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
            style: const TextStyle(
              color: Color(0xFF474747),
              fontSize: 16,
              fontFamily: 'Ubuntu',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildDescriptionField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'Description',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Ubuntu',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Container(
          height: 150,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0xFF939393)),
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
            style: const TextStyle(
              color: Color(0xFF474747),
              fontSize: 16,
              fontFamily: 'Ubuntu',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 4.0),
          child: Text(
            'Briefly describe your concern',
            style: TextStyle(
              color: Color(0xFF505050),
              fontSize: 12,
              fontFamily: 'Roboto Serif',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildAboutBox() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            'About Inquiries',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Ubuntu',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
        ),
        Text(
          'You may ask about anything as long it is in relation to your studies and experiences on campus! Make sure you provide all relevant details. Keep in mind that your inquiry may be used for training purposes. If you wish for your inquiries to be confidential, ensure that you mention that in your inquiry.\n',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontFamily: 'Ubuntu',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
      ],
    );
  }

  Widget buildSubmitButton() {
    return GestureDetector(
      onTap: () {
        // TODO: Submit inquiry
      },
      child: Container(
        width: double.infinity,
        height: 49,
        decoration: ShapeDecoration(
          color: const Color(0xFFA6192E),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
        ),
        child: const Center(
          child: Text(
            'Submit',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontFamily: 'Ubuntu',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFFDEE2E6),
          border: Border.all(
            width: 1,
            color: Colors.black.withOpacity(0.2),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Inquiry Form',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 34,
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Divider(
                thickness: 3,
                color: Color(0x66A6192E),
              ),
              buildAboutBox(),
              const SizedBox(height: 16),
              buildTextFieldWithLabel('Title', _titleController),
              const SizedBox(height: 10),
              buildDescriptionField(),
              const SizedBox(height: 16),
              buildSubmitButton(),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
