import 'dart:math';
import 'package:flutter/material.dart';
import 'package:job_test_task/const/app_theme.dart';

class DarkModeTransition extends StatefulWidget {
  const DarkModeTransition(
      {required this.childBuilder,
      Key? key,
      this.offset = Offset.zero,
      this.themeController,
      this.radius,
      this.duration = const Duration(milliseconds: 400),
      this.isDark = false})
      : super(key: key);
  final Widget Function(BuildContext, int) childBuilder;
  final bool isDark;
  final AnimationController? themeController;
  final Offset offset;
  final double? radius;

  final Duration? duration;

  @override
  _DarkModeTransitionState createState() => _DarkModeTransitionState();
}

class _DarkModeTransitionState extends State<DarkModeTransition>
    with SingleTickerProviderStateMixin {
  @override
  void dispose() {
    _darkNotifier.dispose();
    super.dispose();
  }

  final _darkNotifier = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    if (widget.themeController == null) {
      _animationController =
          AnimationController(vsync: this, duration: widget.duration);
    } else {
      _animationController = widget.themeController!;
    }
  }

  double _radius(Size size) {
    final maxVal = max(size.width, size.height);
    return maxVal * 1.5;
  }

  late AnimationController _animationController;
  double x = 0;
  double y = 0;
  bool isDark = false;
  bool isDarkVisible = false;
  late double radius;
  Offset position = Offset.zero;

  ThemeData getTheme(bool dark) {
    if (dark) {
      return AppTheme.darkTheme;
    } else {
      return AppTheme.lightTheme;
    }
  }

  @override
  void didUpdateWidget(DarkModeTransition oldWidget) {
    super.didUpdateWidget(oldWidget);
    _darkNotifier.value = widget.isDark;
    if (widget.isDark != oldWidget.isDark) {
      if (isDark) {
        _animationController.reverse();
        _darkNotifier.value = false;
      } else {
        _animationController.reset();
        _animationController.forward();
        _darkNotifier.value = true;
      }
      position = widget.offset;
    }
    if (widget.radius != oldWidget.radius) {
      _updateRadius();
    }
    if (widget.duration != oldWidget.duration) {
      _animationController.duration = widget.duration;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateRadius();
  }

  void _updateRadius() {
    final size = MediaQuery.of(context).size;
    if (widget.radius == null) {
      radius = _radius(size);
    } else {
      radius = widget.radius!;
    }
  }

  @override
  Widget build(BuildContext context) {
    isDark = _darkNotifier.value;
    Widget _body(int index) {
      return ValueListenableBuilder<bool>(
          valueListenable: _darkNotifier,
          builder: (BuildContext context, bool isDark, Widget? child) {
            return Theme(
                data: index == 2
                    ? getTheme(!isDarkVisible)
                    : getTheme(isDarkVisible),
                child: widget.childBuilder(context, index));
          });
    }

    return AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget? child) {
          return Stack(
            children: [
              _body(1),
              ClipPath(
                clipper: CircularClipper(
                    _animationController.value * radius, position),
                child: _body(2),
              ),
            ],
          );
        });
  }
}

class CircularClipper extends CustomClipper<Path> {
  const CircularClipper(this.radius, this.center);
  final double radius;
  final Offset center;

  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.addOval(Rect.fromCircle(radius: radius, center: Offset(size.width*0.1  , size.height*0.935)));
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
