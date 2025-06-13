import 'package:flutter/material.dart';

class CookieSheetBottom extends StatelessWidget {
  final Widget title;
  final Alignment? alignmentTitle;
  final Widget body;
  final Color? backgroundColor;
  const CookieSheetBottom({
    super.key,
    required this.title,
    required this.body,
    this.alignmentTitle,
    this.backgroundColor,
  });

  void show(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      // barrierColor: hasBarrierOpacity
      //     ? Theme.of.backgroundColor.withOpacity(0.3)
      //     : Colors.transparent,
      backgroundColor:
          backgroundColor ?? Theme.of(context).colorScheme.onPrimary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: build,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: alignmentTitle ?? Alignment.topLeft,
                child: title,
              ),
              const SizedBox(height: 10),
              body,
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
