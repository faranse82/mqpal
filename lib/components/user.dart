import 'package:flutter/material.dart';
import 'package:googleapis/cloudsearch/v1.dart';
import 'package:uuid/uuid.dart';
import 'package:mqpal/state.dart';
import 'package:provider/provider.dart';


class User {
  final Uuid userId;
  final String emailAddress;
  final DateTime dob;
  final String firstName;
  final String lastName;
  final bool isDarkMode;
  final String passHash;

  User({
    required this.userId,
    required this.emailAddress,
    required this.dob,
    required this.firstName,
    required this.lastName,
    required this.isDarkMode, 
    required this.passHash,
  });
}

class NewUser extends StatefulWidget {
  const NewUser({super.key});

  @override
  _NewUserState createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  final TextEditingController firstNameInput = TextEditingController();
  final TextEditingController lastNameInput = TextEditingController();
  final TextEditingController emailInput = TextEditingController();
  final InputDatePickerFormField dobInput = InputDatePickerFormField(
    firstDate: DateTime(DateTime.now().year - 100),
    lastDate: DateTime.now());
  final TextEditingController passwordInput = TextEditingController()
  void createUser() {
    final String firstName = firstNameInput.text;
    final String lastName = lastNameInput.text;
    final String emailAddress = emailInput.text;
    final DateTime dob = dobInput.toString();

  }

}