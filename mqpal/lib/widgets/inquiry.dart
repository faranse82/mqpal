import 'package:flutter/material.dart';

class NewInquiry extends StatelessWidget {
  Widget buildTextFieldWithLabel(String label, String hintText) {
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
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0xFF939393)),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Text(
            hintText,
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
          child: const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin at euismod ipsum.',
            style: TextStyle(
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
    return Container(
      width: 400,
      height: 150,
      child: const Column(
        children: [
          SizedBox(
            width: 400,
            height: 37,
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
          SizedBox(height: 10),
          SizedBox(
            height: 100,
            child: Text(
              'You may ask about anything as long it is in relation to your studies and experiences on campus! Make sure you provide all relevant details. Keep in mind that your inquiry may be used for training purposed. If you wish for your inquiries to be confidential, ensure you tick the confidentiality box.\n',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'Ubuntu',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget buildSubmitButton() {
    return Container(
      width: 154,
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
    );
  }

  const NewInquiry({super.key});

  @override
  Widget build(context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
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
              buildTextFieldWithLabel('Title', 'Example title'),
              const SizedBox(height: 10),
              buildDescriptionField(),
              const SizedBox(height: 16),
              buildSubmitButton(),
              const Divider(
                thickness: 3,
                color: Color(0xFFA6192E),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
