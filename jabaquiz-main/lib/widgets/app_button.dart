import 'package:flutter/material.dart';
import 'package:jabaquiz/theme.dart';

class AppButton extends StatelessWidget {
  final String label;
  final Color? backgroundColor;
  final VoidCallback? onPressed;
  final bool expanded;

  const AppButton.expanded({
    Key? key,
    required this.label,
    required this.onPressed,
    this.backgroundColor,
  })  : expanded = true,
        super(key: key);

  const AppButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.backgroundColor,
  })  : expanded = false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (expanded) {
      return Row(
        children: [
          Expanded(
            child: _button(context),
          )
        ],
      );
    }
    return _button(context);
  }

  Widget _button(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        elevation: 8.0,
        child: FilledButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
            ),
            side: BorderSide(
              color: bamYellow,
              width: 2,
            ),
            backgroundColor: backgroundColor,
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Text(
              label.toUpperCase(),
              style: Theme.of(context).primaryTextTheme.bodyLarge,
            ),
          ),
        ),
      ),
    );
  }
}
