import 'package:flutter/material.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_secondary_button.dart';

class RentalCompleteDownloadButton extends StatelessWidget {
  const RentalCompleteDownloadButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSecondaryButton(
      width: MediaQuery.widthOf(context),
      text: 'Download Invoices',
      icon: IconsPath.download,
      onPressed: () {},
    );
  }
}
