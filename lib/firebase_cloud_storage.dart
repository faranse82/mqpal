import 'dart:convert';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mqpal/config.dart';
import 'package:mqpal/widgets/inquiry.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class FirebaseStorageService {
  static Future<String> uploadInquiriesToStorage(
      List<Inquiry> inquiries) async {
    try {
      final jsonData =
          json.encode(inquiries.map((inquiry) => inquiry.toJson()).toList());
      final tempDir = await getTemporaryDirectory();
      final file = File('${tempDir.path}/inquiries.json');
      await file.writeAsString(jsonData);

      final ref =
          FirebaseStorage.instance.ref().child('inquiries/inquiries.json');
      final uploadTask = ref.putFile(file);
      final snapshot = await uploadTask.whenComplete(() {});
      final downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      return '';
    }
  }

  static Future<List<Inquiry>> loadInquiriesFromStorage() async {
    try {
      final ref =
          FirebaseStorage.instance.ref().child('inquiries/inquiries.json');
      final downloadUrl = await ref.getDownloadURL();
      final response = await http.get(Uri.parse(downloadUrl));

      if (response.statusCode == 200) {
        final jsonData = response.body;
        final List<dynamic> inquiriesJson = json.decode(jsonData);
        return inquiriesJson.map((json) => Inquiry.fromJson(json)).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  static Future<String> uploadConfigToStorage(Config config) async {
    final jsonData = json.encode(config.toJson());
    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/config.json');
    await file.writeAsString(jsonData);

    final ref = FirebaseStorage.instance.ref().child('config/config.json');
    final uploadTask = ref.putFile(file);
    final snapshot = await uploadTask.whenComplete(() {});
    final downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  static Future<Config> loadConfigFromStorage() async {
    final ref = FirebaseStorage.instance.ref().child('config/config.json');
    final downloadUrl = await ref.getDownloadURL();
    final response = await http.get(Uri.parse(downloadUrl));

    if (response.statusCode == 200) {
      final jsonData = response.body;
      final Map<String, dynamic> data = json.decode(jsonData);
      return Config.fromJson(data);
    } else {
      return Config();
    }
  }
}
