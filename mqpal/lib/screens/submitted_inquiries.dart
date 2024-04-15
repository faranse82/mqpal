import 'package:flutter/material.dart';
import 'package:mqpal/state.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SubmittedInquiriesScreen extends StatefulWidget {
  final String? inquiry;

  const SubmittedInquiriesScreen({super.key, this.inquiry});

  @override
  _SubmittedInquiriesScreenState createState() =>
      _SubmittedInquiriesScreenState();
}

class _SubmittedInquiriesScreenState extends State<SubmittedInquiriesScreen> {
  List<String> _inquiries = [];

  @override
  void initState() {
    super.initState();
    _loadInquiries().then((_) {
      if (widget.inquiry != null) {
        _addInquiry(widget.inquiry!);
      }
    });
  }

  Future<void> _loadInquiries() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _inquiries = prefs.getStringList('inquiries') ?? [];
    });
  }

  Future<void> _saveInquiries() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('inquiries', _inquiries);
  }

  void _addInquiry(String inquiry) {
    setState(() {
      _inquiries.add(inquiry);
    });
    _saveInquiries();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
        ),
        child: Stack(
          children: [
            // Top header
            Positioned(
              child: Container(
                width: screenWidth,
                height: 0.12 * screenHeight,
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
                      child: Text('Inquiries',
                          style: Theme.of(context).textTheme.titleLarge),
                    ),
                  ],
                ),
              ),
            ),

            // Past inquiries section
            Positioned(
              left: 23,
              right: 23,
              top: screenHeight * 0.14,
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
                      color: Theme.of(context).colorScheme.surface,
                      border: Border.all(
                        color: Colors.black.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: _inquiries.isEmpty
                        ? Center(
                            child: Text(
                              'No inquiries found',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          )
                        : ListView.builder(
                            itemCount: _inquiries.length,
                            itemBuilder: (context, index) {
                              final inquiryParts =
                                  _inquiries[index].split('|||');
                              final title = inquiryParts[0];
                              final date = inquiryParts[2];
                              final time = inquiryParts[3];

                              return Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 16),
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.surface,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Colors.black.withOpacity(0.2),
                                    width: 1,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Inquiry ${index + 1}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                    ),
                                    SizedBox(height: screenHeight * 0.01),
                                    Text(
                                      'In progress - $date, $time',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                    SizedBox(height: screenHeight * 0.01),
                                    Text(
                                      title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                  ],
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
                    _buildNavButton('Inquiries', 'inquiries.png', () {}),
                    _buildNavButton('Home', 'home-page.png', () {
                      Navigator.pop(context);
                    }),
                    _buildNavButton('Map', 'map.png', () {
                      Provider.of<StateModel>(context, listen: false)
                          .toggleMap();
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
