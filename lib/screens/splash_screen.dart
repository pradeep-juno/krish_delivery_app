import 'package:flutter/material.dart';
import 'package:krish_delivery_customer/screens/bottom_nav_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animate = false;

  @override
  void initState() {
    super.initState();

    // Start animation after a small delay
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        animate = true;
      });
    });

    // Move to the next screen after 2.5 seconds
    Future.delayed(const Duration(seconds: 2, milliseconds: 500), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomNavBar()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double imageSize =
        MediaQuery.of(context).size.width * 0.60; // Adjusted size

    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.lightBlue, Colors.purpleAccent],
              ),
            ),
          ),

          // Animated Top Right Image (Starts from outside the right)
          AnimatedPositioned(
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            top: MediaQuery.of(context).size.height * 0.00,
            right:
                animate
                    ? MediaQuery.of(context).size.width * 0.00
                    : -imageSize, // Moves in from the right
            child: SizedBox(
              height: imageSize,
              width: imageSize,
              child: Image.asset(
                "assets/images/turkish_dish.png",
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Animated Bottom Left Image (Starts from outside the left)
          AnimatedPositioned(
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            bottom: MediaQuery.of(context).size.height * 0.00,
            left:
                animate
                    ? MediaQuery.of(context).size.width * 0.00
                    : -imageSize, // Moves in from the left
            child: SizedBox(
              height: imageSize,
              width: imageSize,
              child: Image.asset("assets/images/pizza.png", fit: BoxFit.cover),
            ),
          ),

          // Center Logo with Fade-in Animation
          Center(
            child: AnimatedOpacity(
              duration: const Duration(seconds: 1),
              opacity: animate ? 1 : 0, // Fade-in effect
              child: SizedBox(
                height: 240,
                child: Image.asset("assets/images/ic_logo.png"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
