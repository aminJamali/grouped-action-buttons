import 'package:flutter/material.dart';

import 'expanding_action_button.dart';

class GroupedActionButtons extends StatefulWidget {
  final bool initialOpen;
  final double distance;
  final ShapeBorder openButtonShape;
  final ShapeBorder closeButtonShape;
  final Icon openButtonIcon;
  final Icon closeButtonIcon;
  final Color closeButtonColor;
  final Color openButtonColor;
  final double elevation;
  final Size closeButtonSize;
  final List<Widget> children;

  const GroupedActionButtons({
    required this.distance,
    required this.children,
    required this.openButtonIcon,
    required this.closeButtonIcon,
    this.elevation = 4,
    this.closeButtonSize = const Size(44, 44),
    this.openButtonColor = Colors.blue,
    this.closeButtonColor = Colors.blue,
    this.openButtonShape = const CircleBorder(),
    this.closeButtonShape = const CircleBorder(),
    this.initialOpen = false,
    super.key,
  });

  @override
  State<GroupedActionButtons> createState() => _GroupedActionButtonsState();
}

class _GroupedActionButtonsState extends State<GroupedActionButtons>
    with SingleTickerProviderStateMixin {
  bool _open = false;
  late final AnimationController _controller;
  late final Animation<double> _expandAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      value: _open ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.easeOutQuad,
      parent: _controller,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _open = !_open;
      if (_open) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(final BuildContext context) => SizedBox.expand(
        child: Stack(
          alignment: Alignment.bottomRight,
          clipBehavior: Clip.none,
          children: [
            _buildTapToCloseFab(),
            ..._buildExpandingActionButtons(),
            _buildTapToOpenFab(),
          ],
        ),
      );

  List<Widget> _buildExpandingActionButtons() {
    final children = <Widget>[];
    final count = widget.children.length;
    final step = 90.0 / (count - 1);
    for (var i = 0, angleInDegrees = 0.0;
        i < count;
        i++, angleInDegrees += step) {
      children.add(
        ExpandingActionButton(
          directionInDegrees: angleInDegrees,
          maxDistance: widget.distance,
          progress: _expandAnimation,
          child: widget.children[i],
        ),
      );
    }
    return children;
  }

  Widget _buildTapToCloseFab() => SizedBox(
        width: widget.closeButtonSize.width,
        height: widget.closeButtonSize.height,
        child: Center(
          child: Material(
            shape: widget.closeButtonShape,
            clipBehavior: Clip.antiAlias,
            color: widget.closeButtonColor,
            elevation: widget.elevation,
            child: InkWell(
              onTap: _toggle,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: widget.closeButtonIcon,
              ),
            ),
          ),
        ),
      );

  Widget _buildTapToOpenFab() => IgnorePointer(
        ignoring: _open,
        child: AnimatedContainer(
          transformAlignment: Alignment.center,
          transform: Matrix4.diagonal3Values(
            _open ? 0.7 : 1.0,
            _open ? 0.7 : 1.0,
            1,
          ),
          duration: const Duration(milliseconds: 250),
          curve: const Interval(0, 0.5, curve: Curves.easeOut),
          child: AnimatedOpacity(
            opacity: _open ? 0.0 : 1.0,
            curve: const Interval(0.25, 1, curve: Curves.easeInOut),
            duration: const Duration(milliseconds: 250),
            child: FloatingActionButton(
              onPressed: _toggle,
              backgroundColor: widget.openButtonColor,
              elevation: widget.elevation,
              shape: widget.openButtonShape,
              child: widget.openButtonIcon,
            ),
          ),
        ),
      );
}
