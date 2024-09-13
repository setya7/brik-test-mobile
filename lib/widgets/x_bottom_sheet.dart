/*
 * @Author: christyastama
 * @Date: 13/09/24 at 19.10
 */

import 'package:flutter/material.dart';

Future<Object?> showXBottomSheet(
    BuildContext context, {
      required Widget child,
      bool isDismissible = true,
      bool isWithDividerExt = true,
    }) {
  return showModalBottomSheet(
    isDismissible: isDismissible,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(28),
        topLeft: Radius.circular(28),
      ),
    ),
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    builder: (_) {
      return Padding(
        padding: MediaQuery.of(_).viewInsets,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 32),
            if (isWithDividerExt)
              SizedBox(
                  height: 4,
                  width: 32,
                  child: Material(
                    color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(10),
                  )),
            if (isWithDividerExt) const SizedBox(height: 8),
            Flexible(
              child: Material(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                  child: child,
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}