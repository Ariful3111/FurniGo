import 'package:flutter/material.dart';
import 'package:zb_dezign/shared/widgets/details_row_model.dart';

class CommercialPendingBranding extends StatelessWidget {
  const CommercialPendingBranding({super.key});

  @override
  Widget build(BuildContext context) {
    List branding = [
      {'title': 'Branding', 'value': 'Required'},
      {'title': 'Branding', 'value': 'Required'},
      {'title': 'Branding', 'value': 'Required'},
    ];
    return DetailsRowModel(data: branding);
  }
}
