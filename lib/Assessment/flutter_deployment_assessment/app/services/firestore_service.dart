import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tops_flutter_assignment/Assessment/flutter_deployment_assessment/modules/home/models/denomination_model.dart';


class FirestoreService {
  static Future<void> saveData({
    required List<Denomination> notes,
    required DateTime date,
    required TimeOfDay time,
  }) async {
    final db = FirebaseFirestore.instance.collection('cash_records');

    await db.add({
      'date': "${date.year}-${date.month}-${date.day}",
      'time': "${time.hour}:${time.minute}",
      'total': notes.fold(0, (sum, item) => sum + item.total),
      'notes': notes.map((e) => e.toJson()).toList(),
      'timestamp': FieldValue.serverTimestamp()
    });
  }
}
