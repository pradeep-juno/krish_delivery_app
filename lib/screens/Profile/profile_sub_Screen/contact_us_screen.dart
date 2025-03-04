import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final ScrollController _scrollController = ScrollController();
  final Map<int, GlobalKey> _faqKeys = {};

  void _scrollToItem(int index) {
    final key = _faqKeys[index]?.currentContext;
    if (key != null) {
      Scrollable.ensureVisible(
        key,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  String mobile_contact = "7397610580";
  String email_contact =
      "example@example.com"; // Replace with the required email
  String whatsapp_contact = "7397610580";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.3;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: height,
                    width: double.infinity,
                    child: Image.asset(
                      "assets/images/contact_us.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: height,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.8),
                          Colors.black.withOpacity(0.2),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 15,
                      ),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: const Icon(
                              Icons.arrow_back,
                              size: 28,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            "Contact & Support",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: height * 0.65,
                    left: 20,
                    right: 20,
                    child: Column(
                      children: const [
                        Text(
                          "Need Help !",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Tell Us More & Will Be Happy To Assist You",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(5, 5, 69, 2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Support Title
                      Row(
                        children: [
                          const Icon(Icons.headset_mic, color: Colors.white),
                          const SizedBox(width: 10),
                          const Text(
                            "Support",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: const [
                          Text(
                            "For Any Queries",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                          SizedBox(width: 5),
                          Icon(Icons.arrow_right_alt, color: Colors.white70),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // Contact Information
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Email Section
                          Expanded(
                            child: Row(
                              children: [
                                Icon(Icons.email, color: Colors.white),
                                SizedBox(width: 5),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Email",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    InkWell(
                                      onTap: () {
                                        launch(
                                          "mailto:$email_contact?subject=&body=",
                                        );
                                      },
                                      child: const Text(
                                        "Xyz@Gmail.Com",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          decoration: TextDecoration.underline,
                                          decorationColor: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // Contact Section
                          Expanded(
                            child: Row(
                              children: [
                                Icon(Icons.phone, color: Colors.white),
                                SizedBox(width: 5),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Contact",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    InkWell(
                                      onTap: () {
                                        launch("tel:$mobile_contact");
                                      },
                                      child: const Text(
                                        "9025789955",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          decoration: TextDecoration.underline,
                                          decorationColor: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // WhatsApp Button
                      SizedBox(
                        width: 160,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            launch(
                              "https://wa.me/$whatsapp_contact?text=Hello",
                            );
                          },
                          icon: const FaIcon(
                            FontAwesomeIcons.whatsapp,
                            color: Colors.white,
                            size: 20,
                          ),
                          label: const Text(
                            "WhatsApp",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                child: Text(
                  "FAQ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.black,
                  ),
                ),
              ),
              buildFAQItem(
                0,
                "What Payment Methods Are Accepted?",
                "We Accept Multiple Payment Options, Including Credit/Debit Cards, UPI, Net Banking, And Cash On Delivery (COD).",
              ),
              buildFAQItem(
                1,
                "How can I contact customer support?",
                "You can reach us via email, phone, or WhatsApp for any queries.",
              ),
              buildFAQItem(
                2,
                "Do you offer refunds?",
                "Yes, refunds are processed within 7-10 working days as per our refund policy.",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFAQItem(int index, String question, String answer) {
    _faqKeys[index] = GlobalKey();
    return Padding(
      key: _faqKeys[index],
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromRGBO(5, 5, 69, 1), Color.fromRGBO(5, 5, 69, 3)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Theme(
          data: ThemeData().copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            onExpansionChanged: (isExpanded) {
              if (isExpanded) {
                Future.delayed(Duration(milliseconds: 200), () {
                  _scrollToItem(index);
                });
              }
            },
            collapsedIconColor: Colors.white,
            iconColor: Colors.white,
            title: Text(
              question,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(174, 166, 166, 5),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(8),
                  ),
                ),
                child: Text(
                  answer,
                  style: const TextStyle(fontSize: 12, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
