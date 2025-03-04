import 'dart:math';

import 'package:flutter/material.dart';

class SwingingImage extends StatefulWidget {
  final String imagePath;
  final double width;
  final double height;
  final double swingAngle; // Max rotation angle in degrees

  const SwingingImage({
    Key? key,
    required this.imagePath,
    this.width = 30,
    this.height = 30,
    this.swingAngle = 20, // Default swing of 20 degrees
  }) : super(key: key);

  @override
  _SwingingImageState createState() => _SwingingImageState();
}

class _SwingingImageState extends State<SwingingImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 1), // Speed of swing
      vsync: this,
    )..repeat(reverse: true); // Loop back & forth

    _animation = Tween<double>(
      begin: -widget.swingAngle * (pi / 180), // Convert degrees to radians
      end: widget.swingAngle * (pi / 180),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut, // Smooth U-shape swing
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Clean up animation
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.rotate(
          angle: _animation.value, // Rotates left & right
          child: child,
        );
      },
      child: Image.asset(
        widget.imagePath,
        width: widget.width,
        height: widget.height,
      ),
    );
  }
}
