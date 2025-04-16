import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tops_flutter_assignment/Assessment/flutter_deployment_assessment/widgets/denomination_tile.dart';
import '../controllers/home_controller.dart';


class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cash Calculator")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() => Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: controller.notes.length,
                itemBuilder: (context, index) {
                  return DenominationTile(
                    note: controller.notes[index],
                    onChanged: (val) =>
                        controller.updateQuantity(index, val),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total: ₹${controller.totalAmount}",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                IconButton(
                  icon: const Icon(Icons.date_range),
                  onPressed: () => controller.pickDate(context),
                ),
                IconButton(
                  icon: const Icon(Icons.access_time),
                  onPressed: () => controller.pickTime(context),
                )
              ],
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: controller.submitData,
              child: const Text("Submit"),
            )
          ],
        )),
      ),
    );
  }
}
