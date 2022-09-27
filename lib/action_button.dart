import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    required this.icon,
    super.key,
    this.onPressed,
    this.shapeBorder = const CircleBorder(),
    this.elevation = 4,
    this.backgroundColor,
  });

  final VoidCallback? onPressed;
  final Widget icon;
  final Color? backgroundColor;
  final ShapeBorder shapeBorder;
  final double elevation;

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      shape: shapeBorder,
      clipBehavior: Clip.antiAlias,
      color: backgroundColor ?? theme.colorScheme.secondary,
      elevation: elevation,
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
        color: theme.colorScheme.onSecondary,
      ),
    );
  }
}
