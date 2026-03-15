import 'package:flutter/material.dart';
import 'package:zb_dezign/shared/widgets/details_row_model.dart';

class PendingNotes extends StatelessWidget {
  const PendingNotes({super.key});

  @override
  Widget build(BuildContext context) {
    var notes = [
    {'title': 'Custom notes', 'value': 'Required'},
    {'title': 'Material preferences', 'value': 'Yes'},
  ];
    return DetailsRowModel(data: notes);
  }
}