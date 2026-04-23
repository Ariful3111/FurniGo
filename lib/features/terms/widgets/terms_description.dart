import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class TermsDescription extends StatelessWidget {
  const TermsDescription({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    final List<Map<String, String>> sections = [
      {
        "title": "Terms of Service : ZB Design",
        "description":
            "By accessing and using this website and its renovation, room design, and interior design services, you agree that all content provided—including design concepts, layouts, measurements, timelines, cost estimates, and material suggestions—is offered for general guidance and conceptual purposes only. Any project decisions, approvals, or implementation based on this information are made at your own discretion and risk. We do not provide licensed architectural, engineering, or construction services and do not replace professional consultation. We reserve the right to modify, update, suspend, or discontinue any part of the service at any time without prior notice. Unauthorized reproduction, distribution, or commercial use of our designs or content is strictly prohibited."
      },
      {
        "title": "Privacy Policy",
        "description":
            "We are committed to safeguarding your personal and project-related information. Information such as your name, email address, phone number, uploaded room images, floor plans, and design preferences is collected solely to deliver, improve, and personalize our services. We may use anonymized or aggregated data for internal analysis and service enhancement. We implement reasonable security measures to protect your data; however, no digital platform can guarantee complete security. By using this website, you acknowledge and accept these data practices and understand that online data transmission carries inherent risks."
      },
      {
        "title": "Design & Renovation Disclaimer",
        "description":
            "All room designs, renovation ideas, AI-generated visuals, 3D renderings, color schemes, furniture placements, and space planning recommendations shown on this platform are illustrative and inspirational in nature. Actual results may vary due to site conditions, structural limitations, lighting, material availability, workmanship, local regulations, and budget constraints. Measurements, dimensions, and cost estimates are approximate and should be verified on-site before execution. We do not guarantee compliance with building codes, safety standards, or local regulations. The user assumes full responsibility for verifying feasibility, safety, and legality before implementing any design or renovation work."
      },
      {
        "title": "Limitation of Liability",
        "description":
            "To the fullest extent permitted by law, we shall not be liable for any direct, indirect, incidental, or consequential damages, including but not limited to property damage, financial loss, project delays, or safety issues arising from the use or reliance on our designs, recommendations, or services."
      },
      {
        "title": "Third-Party Services & Materials",
        "description":
            "Our designs may reference third-party products, tools, materials, or service providers for inspiration or convenience. We do not endorse, guarantee, or take responsibility for the quality, availability, pricing, or performance of any third-party products or services."
      },
    ];

    return Column(
      children: [
        SharedContainer(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          radius: 24.r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(sections.length, (index) {
              final item = sections[index];

              return Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomPrimaryText(
                      text: item["title"] ?? "",
                      fontWeight: FontWeight.w600,
                      color: isDark
                          ? AppColors.whiteColor
                          : AppColors.buttonTextColor,
                    ),
                    SizedBox(height: 12.h),
                    CustomPrimaryText(
                      text: item["description"] ?? "",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: isDark
                          ? AppColors.whiteColor
                          : AppColors.buttonTextColor,
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
