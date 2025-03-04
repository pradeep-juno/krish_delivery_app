import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryScreen extends StatefulWidget {
  final VoidCallback onBackPress; // Use a clear and required callback

  const CategoryScreen({required this.onBackPress, Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final List<Map<String, String>> categories = [
    {
      "image": "assets/images/dairy_product.png",
      "title": "Milk Products",
      "subtitle": "Lorem ipsum dolor",
    },
    {
      "image": "assets/images/burger.png",
      "title": "Crispy Burgers",
      "subtitle": "Sit amet consectetur",
    },
    {
      "image": "assets/images/dairy_product.png",
      "title": "Milk Products",
      "subtitle": "Lorem ipsum dolor",
    },
    {
      "image": "assets/images/dairy_product.png",
      "title": "Milk Products",
      "subtitle": "Lorem ipsum dolor",
    },
    {
      "image": "assets/images/burger.png",
      "title": "Crispy Burgers",
      "subtitle": "Sit amet consectetur",
    },
    {
      "image": "assets/images/dairy_product.png",
      "title": "Milk Products",
      "subtitle": "Lorem ipsum dolor",
    },
    {
      "image": "assets/images/burger.png",
      "title": "Crispy Burgers",
      "subtitle": "Sit amet consectetur",
    },
  ];

  final List<double> heights = [210, 160]; // Two dynamic heights

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          title: Text(
            "Categories",
            style: GoogleFonts.openSans(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.grey),
            onPressed: () {
              print("back button press ");
              widget.onBackPress();
              // Get.off(() => BottomNavBar());
            },
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
          child: Column(
            children: [
              Container(
                height: 56,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.black.withOpacity(0.2),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search Categories",
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: MasonryGridView.builder(
                  gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 columns
                  ),
                  itemCount: categories.length,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  itemBuilder: (context, index) {
                    return CategoryCard(
                      imagePath: categories[index]["image"]!,
                      title: categories[index]["title"]!,
                      subtitle: categories[index]["subtitle"]!,
                      height:
                          heights[index % 2], // Alternate between 210 and 160
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final double height;

  CategoryCard({
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    // Dynamic BoxFit based on height
    BoxFit imageFit = height >= 160 ? BoxFit.cover : BoxFit.fitHeight;

    // Dynamic font sizes
    double titleFontSize = height >= 210 ? 18 : 16;
    double subtitleFontSize = height >= 210 ? 14 : 12;
    double textPadding = height >= 210 ? 12 : 8;

    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Stack(
        fit: StackFit.expand,
        children: [
          /// Background Image
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(imagePath, fit: imageFit),
          ),

          /// Dark gradient overlay
          Container(
            height: height,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),

          /// Positioned text at the bottom
          Positioned(
            left: textPadding,
            bottom: textPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: titleFontSize,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: subtitleFontSize,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
