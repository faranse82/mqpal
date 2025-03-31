import 'dart:convert';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mqpal/config.dart';
import 'package:mqpal/widgets/inquiry.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class FirebaseStorageService {
  // encodes the list inquiries that were passed to it into a json file which is then uploaded to firebase storage
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
    // downloads the inquiries.json files from firebase server, decodes it, and is then turned into a list which is shown in the submitted inquiries screen
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

  // encodes the theme state into a json file which is then uploaded to firebase servers
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

  // downlods config.json, decodes it, and sets whether or not the app should open in dark or light mode
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
