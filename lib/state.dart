import 'package:flutter/material.dart';
import 'package:mqpal/config.dart';
import 'package:mqpal/firebase_cloud_storage.dart';
import 'package:mqpal/widgets/inquiry.dart';

class StateModel with ChangeNotifier {
  bool _isExpanded = false;
  bool _isMapOpen = false;
  bool _isDarkMode = false;
  bool _isSuccessInq = false;
  bool _hasAnswered = false;
  List<Inquiry> _inquiries = [];

  // Getters
  bool get isExpanded => _isExpanded;
  bool get isMapOpen => _isMapOpen;
  bool get isDarkMode => _isDarkMode;
  bool get isSuccessInq => _isSuccessInq;
  bool get hasAnswered => _hasAnswered;
  List<Inquiry> get inquiries => _inquiries;

  // Setters

  //opens/closes inquiry form
  void toggleInquiryForm() {
    _isExpanded = !_isExpanded;
    notifyListeners();
  }

  //submits inquiry form
  void submitInquiryForm() {
    _isSuccessInq = true;
    notifyListeners();
  }

  //closes/opens the confirmation box
  void toggleConfirmation() {
    _hasAnswered = !hasAnswered;
    notifyListeners();
  }

  //resets inquiry form after use
  void resetInquiryForm() {
    _isSuccessInq = false;
    notifyListeners();
  }

  //opens closes map
  void toggleMap() {
    _isMapOpen = !_isMapOpen;
    notifyListeners();
  }

  //toggles theme
  void toggleDarkMode() {
    _isDarkMode = !_isDarkMode;
    saveConfig();
    notifyListeners();
  }

  //downloads and loads inquiries from firebase
  Future<void> loadInquiries() async {
    _inquiries = await FirebaseStorageService.loadInquiriesFromStorage();
    notifyListeners();
  }

  //adds submitted inquiry to the app and saves it to firebase
  Future<void> addInquiry(Inquiry inquiry) async {
    try {
      _inquiries.add(inquiry);
      await FirebaseStorageService.uploadInquiriesToStorage(_inquiries);
      notifyListeners();
    } catch (e) {
      throw Exception('Failed to add inquiry: $e');
    }
  }

  //uploads the current inquiries to firebase
  void updateInquiry(Inquiry oldInquiry, Inquiry newInquiry) {
    final index = _inquiries.indexOf(oldInquiry);
    if (index != -1) {
      _inquiries[index] = newInquiry;
      FirebaseStorageService.uploadInquiriesToStorage(_inquiries);
      notifyListeners();
    }
  }

  // custom pop up notifaction for cancelling or updating inquiries
  void popUpMessage(String transaction, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Inquiry $transaction successfully'),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * 0.75,
          left: MediaQuery.of(context).size.width * 0.05,
          right: MediaQuery.of(context).size.width * 0.05,
        ),
      ),
    );
  }

  //load theme on to the app.
  Future<void> loadConfig() async {
    final config = await FirebaseStorageService.loadConfigFromStorage();
    _isDarkMode = config.isDarkMode;
    notifyListeners();
  }

  //uploads current theme to firebase
  Future<void> saveConfig() async {
    final config = Config(isDarkMode: _isDarkMode);
    await FirebaseStorageService.uploadConfigToStorage(config);
  }
}
