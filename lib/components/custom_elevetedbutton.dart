import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// class CustomElevetedButton extends StatelessWidget {
//   final String text;
//   final VoidCallback onPressed;
//   final bool isLoading;
//   final Color color;
//   final TextStyle? textStyle;
//   final double? width;
//   final double? height;
//   final BorderRadiusGeometry? borderRadius;
//   final bool isGoogleButton;

//   const CustomElevetedButton({
//     Key? key,
//     required this.text,
//     required this.onPressed,
//     this.isLoading = false,
//     this.color = Colors.white,
//     this.textStyle,
//     this.width,
//     this.height,
//     this.borderRadius,
//     this.isGoogleButton = false,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final buttonWidth = width ?? size.width;
//     final buttonHeight = height ?? size.width / 8;
//     final buttonBorderRadius = borderRadius ?? BorderRadius.circular(15);

//     return ClipRRect(
//       borderRadius: buttonBorderRadius,
//       child: BackdropFilter(
//         filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
//         child: InkWell(
//           highlightColor: Colors.transparent,
//           splashColor: Colors.transparent,
//           onTap: isLoading ? null : onPressed,
//           child: Container(
//             height: buttonHeight,
//             width: buttonWidth,
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               color: Colors.white.withOpacity(.05),
//               borderRadius: buttonBorderRadius,
//             ),
//             child: isLoading
//                 ? Center(
//                     child: CircularProgressIndicator(
//                       color: Colors.white.withOpacity(.8),
//                       strokeWidth: 2,
//                     ),
//                   )
//                 : isGoogleButton
//                 ? Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         'G',
//                         style:
//                             textStyle ??
//                             GoogleFonts.poppins(
//                               color: Colors.white.withOpacity(.8),
//                               fontSize: 40,
//                               fontWeight: FontWeight.bold,
//                             ),
//                       ),
//                       SizedBox(width: 10),
//                       Text(
//                         text,
//                         style:
//                             textStyle ??
//                             GoogleFonts.poppins(
//                               color: Colors.white.withOpacity(.8),
//                               fontSize: 16,
//                             ),
//                       ),
//                     ],
//                   )
//                 : Text(
//                     text,
//                     style:
//                         textStyle ??
//                         GoogleFonts.poppins(
//                           color: Colors.white.withOpacity(.8),
//                           fontSize: 16,
//                         ),
//                   ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class CustomElevetedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final Color backgroundColor;
  final Color foregroundColor;
  final TextStyle? textStyle;
  final double? width;
  final double? height;
  final BorderRadiusGeometry? borderRadius;
  final bool isGoogleButton;

  const CustomElevetedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.backgroundColor = Colors.white,
    this.foregroundColor = Colors.black,
    this.textStyle,
    this.width,
    this.height,
    this.borderRadius,
    this.isGoogleButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white.withOpacity(.05),
        foregroundColor: Colors.white.withOpacity(.8),
        fixedSize: Size(width ?? size.width, height ?? size.width / 8),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(15),
        ),
        elevation: 0,
      ),
      onPressed: isLoading ? null : onPressed,
      child: isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.white.withOpacity(.8),
                strokeWidth: 2,
              ),
            )
          : isGoogleButton
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'G',
                  style:
                      textStyle ??
                      GoogleFonts.poppins(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(width: 10),
                Text(
                  text,
                  style: textStyle ?? GoogleFonts.poppins(fontSize: 16),
                ),
              ],
            )
          : Text(text, style: textStyle ?? GoogleFonts.poppins(fontSize: 16)),
    );
  }
}
