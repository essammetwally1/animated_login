import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final String? iconPathName;
  final TextEditingController? controller;
  final void Function(String)? onChange;
  final VoidCallback? onPressed;
  final int? maxLines;
  final String? Function(String?)? validator;
  final bool isPassword;
  final bool isEmail;
  final VoidCallback? onTap;
  final bool readOnly;

  const CustomTextField({
    super.key,
    this.hintText,
    this.iconPathName,
    this.controller,
    this.onChange,
    this.maxLines = 1,
    this.validator,
    this.onPressed,
    this.onTap,
    this.readOnly = false,
    this.isPassword = false,
    this.isEmail = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _showPassword = true;
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
        child: Container(
          height: widget.maxLines! > 1 ? null : size.width / 8,
          alignment: Alignment.center,
          padding: EdgeInsets.only(
            right: size.width / 30,
            left: widget.iconPathName != null ? 0 : size.width / 30,
          ),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: .05),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextFormField(
            validator: widget.validator,
            maxLines: widget.maxLines,
            controller: widget.controller,
            obscureText: widget.isPassword ? _showPassword : false,
            keyboardType: widget.isEmail
                ? TextInputType.emailAddress
                : TextInputType.text,
            focusNode: _focusNode,
            readOnly: widget.readOnly,
            onChanged: widget.onChange,
            onTap: widget.onTap,
            onTapOutside: (_) {
              _focusNode.unfocus();
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            cursorColor: Colors.white,
            style: GoogleFonts.poppins(
              color: Colors.white.withValues(alpha: .8),
              fontSize: 16, // Added font size for better centering
            ),
            textAlignVertical:
                TextAlignVertical.center, // Center text vertically
            decoration: InputDecoration(
              // Remove all borders and underlines
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,

              hintText: widget.hintText,
              hintStyle: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.white.withValues(alpha: .5),
              ),

              // Proper content padding for vertical centering
              contentPadding: EdgeInsets.symmetric(
                vertical: size.width / 24, // Adjusted for better centering
                horizontal: 12,
              ),

              // Icon padding for better alignment
              isDense: true,

              suffixIcon: widget.isPassword
                  ? Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: IconButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onPressed: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        },
                        icon: _showPassword
                            ? Icon(
                                Icons.visibility_off_outlined,
                                color: Colors.white.withValues(alpha: .7),
                                size: 20,
                              )
                            : Icon(
                                Icons.visibility_outlined,
                                color: Colors.white.withValues(alpha: .7),
                                size: 20,
                              ),
                      ),
                    )
                  : null,

              prefixIcon: widget.iconPathName == null
                  ? null
                  : Padding(
                      padding: const EdgeInsets.only(left: 16, right: 12),
                      child: SvgPicture.asset(
                        'assets/${widget.iconPathName}.svg',
                        width: 20,
                        height: 20,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
