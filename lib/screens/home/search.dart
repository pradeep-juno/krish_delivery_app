import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:krish_delivery_customer/screens/home/search_screen.dart';

import '../../utils/functions.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool _isTyping = false;
  final TextEditingController _controller = TextEditingController();

  final List<String> placeholderTexts = [
    "🍛 Biryani",
    "🥘 Sambar",
    "🍚 Curd Rice",
    "🍤 Fish Curry",
    "🥞 Dosa",
  ];
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _isTyping = _controller.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 52,
        width: 380,
        decoration: BoxDecoration(
          color: Color(0xFFF2F2FE), // Background color
          border: Border.all(
            color: Colors.black, // Border color
            width: 0.1, // Border width
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(6), // Border radius
          ),
        ),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.black54),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 40,
                ),
              ),
              style: TextStyle(fontSize: 16),
            ),
            if (!_isTyping)
              Positioned(
                left: 54,
                child: Row(
                  children: [
                    Text(
                      "Search ",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    buildAnimatedPlaceholder(placeholderTexts),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
