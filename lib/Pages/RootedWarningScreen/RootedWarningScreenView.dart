import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RootWarningScreen extends StatelessWidget {
  const RootWarningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Security Risk Detected:\n", // Title text
                  style: GoogleFonts.poppins(
                    fontSize: 18, // Adjust size as needed
                    fontWeight: FontWeight.bold,
                    color: Colors.red, // Title color
                  ),
                ),
                TextSpan(
                  text:
                      "Your device is rooted, which can pose a security risk. Please use a non-rooted device for enhanced security.",
                  style: GoogleFonts.poppins(
                    fontSize: 14, // Adjust size as needed
                    fontWeight: FontWeight.normal,
                    color: Colors.black, // Subtitle color
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
