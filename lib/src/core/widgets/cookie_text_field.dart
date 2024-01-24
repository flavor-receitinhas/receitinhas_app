import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CookieTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final bool border;
  final BorderRadius? borderRadius;
  final int? maxLines;
  final int? maxLength;

  const CookieTextField(
      {super.key,
      this.hintText,
      this.controller,
      this.suffixIcon,
      this.prefixIcon,
      this.obscureText = false,
      this.validator,
      this.maxLines,
      this.borderRadius,
      this.maxLength})
      : border = true;

  const CookieTextField.outline({
    super.key,
    this.hintText,
    this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText = false,
    this.validator,
    this.maxLines,
    this.borderRadius,
    this.maxLength,
  }) : border = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      maxLines: maxLines ?? 1,
      minLines: maxLines ?? 1,
      maxLength: maxLength,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: const EdgeInsets.all(16),
        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.5),
            ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.secondary,
        focusedBorder: OutlineInputBorder(
          borderSide: border
              ? BorderSide(
                  color: Theme.of(context).colorScheme.onSurface, width: 1)
              : const BorderSide(),
          borderRadius: borderRadius ?? BorderRadius.circular(16),
        ),
        border: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: border
              ? BorderSide(color: Theme.of(context).colorScheme.onSurface)
              : const BorderSide(),
          borderRadius: borderRadius ?? BorderRadius.circular(16),
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
    );
  }
}
