import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class User {
  final String userId;
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

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'emailAddress': emailAddress,
      'dob': dob.toIso8601String(),
      'firstName': firstName,
      'lastName': lastName,
      'isDarkMode': isDarkMode,
      'passHash': passHash,
    };
  }

  factory User.fromFirestore(Map<String, dynamic> data) {
    return User(
      userId: data['userId'],
      emailAddress: data['emailAddress'],
      dob: DateTime.parse(data['dob']),
      firstName: data['firstName'],
      lastName: data['lastName'],
      isDarkMode: data['isDarkMode'] ?? false,
      passHash: data['passHash'],
    );
  }

  static String hashPassword(String password) {
    var bytes = utf8.encode(password);
    var digest = sha256.convert(bytes);
    return digest.toString();
  }
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

  DateTime? selectedDate;

  final TextEditingController passwordInput = TextEditingController();
  final TextEditingController passwordConfirmationInput =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(DateTime.now().year - 18),
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  bool isPasswordValid() {
    return passwordInput.text.length >= 8 &&
        passwordInput.text == passwordConfirmationInput.text;
  }

  Future<void> createUser() async {
    if (_formKey.currentState!.validate() && selectedDate != null) {
      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });

      try {
        final String userId = const Uuid().v4();

        final String passHash = User.hashPassword(passwordInput.text);
        final User newUser = User(
          userId: userId,
          emailAddress: emailInput.text.trim(),
          dob: selectedDate!,
          firstName: firstNameInput.text.trim(),
          lastName: lastNameInput.text.trim(),
          isDarkMode: false,
          passHash: passHash,
        );

        await firebase_auth.FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: emailInput.text.trim(),
          password: passwordInput.text,
        );

        await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .set(newUser.toMap());
      } catch (e) {
        setState(() {
          _errorMessage = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
      ),
    );
  }

  @override
  void dispose() {
    firstNameInput.dispose();
    lastNameInput.dispose();
    emailInput.dispose();
    passwordInput.dispose();
    passwordConfirmationInput.dispose();
    super.dispose();
  }
}
