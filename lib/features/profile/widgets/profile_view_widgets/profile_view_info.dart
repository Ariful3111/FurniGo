import 'package:flutter/material.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';

class ProfileViewInfo extends StatelessWidget {
  const ProfileViewInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Column(
          children: [
            ClipPath(
              clipper: ProfileHeaderClipper(),
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff2A5DC8),
                      Color(0xff3BA2F7),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 60),

            /// User Info
            Column(
              children: const [
                Text(
                  "Sadman Sakib",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("sakib@gmail.com | Personal"),
                Text("Credit Balance: 1250"),
              ],
            )
          ],
        ),

        /// Profile Image
        Positioned(
          top: 95,
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: const CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(IconsPath.profileNav),
            ),
          ),
        ),
      ],
    );
  }
}

class ProfileHeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 45;

    Path path = Path();

    path.lineTo(0, size.height - radius);

    path.quadraticBezierTo(
      size.width * 0.25,
      size.height,
      size.width * 0.35,
      size.height,
    );

    /// Circular cut
    path.arcToPoint(
      Offset(size.width * 0.65, size.height),
      radius: Radius.circular(radius),
      clockwise: false,
    );

    path.quadraticBezierTo(
      size.width * 0.75,
      size.height,
      size.width,
      size.height - radius,
    );

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
