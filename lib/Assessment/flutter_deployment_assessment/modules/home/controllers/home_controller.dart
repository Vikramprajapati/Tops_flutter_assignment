import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tops_flutter_assignment/Assessment/flutter_deployment_assessment/app/services/firestore_service.dart';
import '../models/denomination_model.dart';


class HomeController extends GetxController {
  RxList<Denomination> notes = RxList<Denomination>([
    Denomination(denomination: 2000),
    Denomination(denomination: 500),
    Denomination(denomination: 200),
    Denomination(denomination: 100),
    Denomination(denomination: 50),
    Denomination(denomination: 20),
    Denomination(denomination: 10),
    Denomination(denomination: 5),
    Denomination(denomination: 2),
    Denomination(denomination: 1),
  ]);

  Rx<DateTime> selectedDate = DateTime.now().obs;
  Rx<TimeOfDay> selectedTime = TimeOfDay.now().obs;

  int get totalAmount => notes.fold(0, (sum, item) => sum + item.total);

  void updateQuantity(int index, String value) {
    notes[index].quantity = int.tryParse(value) ?? 0;
    notes.refresh();
  }

  void pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) selectedDate.value = picked;
  }

  void pickTime(BuildContext context) async {
    final TimeOfDay? picked =
    await showTimePicker(context: context, initialTime: selectedTime.value);
    if (picked != null) selectedTime.value = picked;
  }

  void submitData() {
    FirestoreService.saveData(
      notes: notes,
      date: selectedDate.value,
      time: selectedTime.value,
    );
    Get.snackbar('Success', 'Data saved successfully');
  }
}
