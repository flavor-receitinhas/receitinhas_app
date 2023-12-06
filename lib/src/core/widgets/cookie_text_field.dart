import 'package:flutter/material.dart';

class CookieTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final bool border;
  final double borderRadiusTopRight;
  final int? maxLines;

  const CookieTextField({
    super.key,
    this.hintText,
    this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText = false,
    this.validator,
    this.maxLines,
  })  : border = true,
        borderRadiusTopRight = 16;

  const CookieTextField.outline({
    super.key,
    this.hintText,
    this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText = false,
    this.validator,
    this.maxLines,
  })  : border = false,
        borderRadiusTopRight = 30;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      maxLines: maxLines ?? 1,
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
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(borderRadiusTopRight),
            bottomLeft: const Radius.circular(16),
            bottomRight: const Radius.circular(16),
            topLeft: const Radius.circular(16),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(borderRadiusTopRight),
            bottomLeft: const Radius.circular(16),
            bottomRight: const Radius.circular(16),
            topLeft: const Radius.circular(16),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: border
              ? BorderSide(color: Theme.of(context).colorScheme.onSurface)
              : const BorderSide(),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(borderRadiusTopRight),
            bottomLeft: const Radius.circular(16),
            bottomRight: const Radius.circular(16),
            topLeft: const Radius.circular(16),
          ),
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
    );
  }
}
