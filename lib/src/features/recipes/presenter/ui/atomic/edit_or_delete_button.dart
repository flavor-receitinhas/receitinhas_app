import 'package:app_receitas/src/core/l10n/app_localizations.dart';
import 'package:app_receitas/src/core/widgets/cookie_export.dart';
import 'package:app_receitas/src/features/home/presenter/ui/pages/custom_bottom_bar.dart';
import 'package:flutter/material.dart'; 

class EditOrDeleteButton extends StatelessWidget {
  final bool ownsTheRecipe;
  final Future<void> Function()? onEdit;
  final Future<void> Function()? onDelete;

  const EditOrDeleteButton({
    super.key,
    required this.ownsTheRecipe,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return ownsTheRecipe
        ? PopupMenuButton<String>(
          icon: const Icon(Icons.more_vert),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onSelected: (value) {
            switch (value) {
              case 'edit':
                onEdit?.call();
                break;
              case 'delete':
                CookieDialog(
                  title: CookieText(text: l10n.deleteRecipeTitle),
                  content: CookieText(text: l10n.deleteRecipeContent),
                  onPressedConfirm: () {
                    onDelete?.call();
                    Navigator.pushNamed(context, CustomBottomBar.route);
                  },
                ).show(context);
                break;
            }
          },
          itemBuilder:
              (context) => [
                // PopupMenuItem(
                //   value: 'edit',
                //   child: Row(
                //     children: const [
                //       Icon(Icons.edit, size: 18),
                //       SizedBox(width: 8),
                //       Text('Editar'),
                //     ],
                //   ),
                // ),
                PopupMenuItem(
                  value: 'delete',
                  child: Row(
                    children: [
                      const Icon(Icons.delete_outline, size: 18),
                      const SizedBox(width: 8),
                      CookieText(text: l10n.deleteButton),
                    ],
                  ),
                ),
              ],
        )
        : const SizedBox.shrink();
  }
}
