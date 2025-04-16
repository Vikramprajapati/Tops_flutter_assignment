import 'package:flutter/material.dart';
import 'package:tops_flutter_assignment/Assessment/flutter_deployment_assessment/modules/home/models/denomination_model.dart';


class DenominationTile extends StatelessWidget {
  final Denomination note;
  final Function(String) onChanged;

  const DenominationTile({
    super.key,
    required this.note,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        title: Text('₹${note.denomination}'),
        subtitle: TextField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(hintText: 'Enter Quantity'),
          onChanged: onChanged,
        ),
        trailing: Text('= ₹${note.total}'),
      ),
    );
  }
}
