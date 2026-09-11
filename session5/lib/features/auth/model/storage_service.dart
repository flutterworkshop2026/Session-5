import 'package:cloud_firestore/cloud_firestore.dart';

class StorageService {
  final storage = FirebaseFirestore.instance;

  Future<void> createUser(String name, String email) async {
    final res = await storage.collection("users").doc("$name").set({
      "name":name, "email":email
    });
  }

  Future<void> updateUser(String name, String email) async {
    final res = await storage.collection("users").doc("user").update({
      "name":name, "email":email
    });
  }

  Future<void> getUser(String name, String email) async {
    final res = await storage.collection("users").doc("user").get();
  }

  Future<void> deleteUser(String name, String email) async {
    final res = await storage.collection("users").doc("user").delete();
  }
}