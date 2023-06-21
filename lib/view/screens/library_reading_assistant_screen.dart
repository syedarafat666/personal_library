// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:http/http.dart';
import 'package:personal_library/controller/add_book_controller.dart';
import 'package:personal_library/controller/get_stats_controller%20.dart';
import 'package:personal_library/controller/logout_controller.dart';
import 'package:personal_library/view/screens/my_books_screen.dart';
import 'package:personal_library/view/screens/signin_screen.dart';
import 'package:personal_library/widgets/add_book_alert_dialogue.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LibraryReadingAssistantScreen extends StatefulWidget {
  const LibraryReadingAssistantScreen({super.key});

  @override
  State<LibraryReadingAssistantScreen> createState() =>
      _LibraryReadingAssistantScreenState();
}

class _LibraryReadingAssistantScreenState
    extends State<LibraryReadingAssistantScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final AddBookController addBookController = Get.put(AddBookController());
  final BooksStatsController booksStatsController =
      Get.put(BooksStatsController());
  final LogoutController logoutController = Get.put(LogoutController());

  // _loadData() async {
  //   await Get.find<BooksStatsController>().bookStats();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Library & Reading Assistant'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () async {
                final SharedPreferences prefs = await _prefs;
                prefs.clear();
                Get.offAll(SigninScreen());
              },
              icon: Icon(Icons.logout_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/Rectangle_3609.png',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              'assets/Group 4647.svg',
                              height: 80,
                              width: 80,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total Books',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            Obx(
                              () {
                                // _loadData();
                                if (booksStatsController.bookStats.value !=
                                    null) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${booksStatsController.bookStats.value.totalBooks}',
                                        style: TextStyle(
                                            fontSize: 40,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    ],
                                  );
                                } else {
                                  return CircularProgressIndicator();
                                }
                              },
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Stack(
                  children: [
                    Image.asset('assets/Rectangle_3610.png'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              'assets/Group 4648.svg',
                              height: 80,
                              width: 80,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Read Books',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            Obx(
                              () {
                                final controller =
                                    Get.find<BooksStatsController>();
                                if (controller.bookStats.value != null) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${controller.bookStats.value.totalFinished}',
                                        style: TextStyle(
                                            fontSize: 40,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    ],
                                  );
                                } else {
                                  return CircularProgressIndicator();
                                }
                              },
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Stack(
                  children: [
                    Image.asset('assets/Rectangle_3611.png'),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 5),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              'assets/Group 4649.svg',
                              height: 80,
                              width: 80,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Current Read Books',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            Obx(
                              () {
                                final controller =
                                    Get.find<BooksStatsController>();
                                if (controller.bookStats.value != null) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${controller.bookStats.value.totalReading}',
                                        style: TextStyle(
                                            fontSize: 40,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    ],
                                  );
                                } else {
                                  return CircularProgressIndicator();
                                }
                              },
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 90,
              ),
              InkWell(
                onTap: () {
                  Get.to(MyBooksScreen());
                },
                child: Stack(
                  children: [
                    Image.asset('assets/Rectangle_3612.png'),
                    Positioned.fill(
                        child: Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/my books.svg',
                            height: 20,
                            width: 20,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'My Books',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => AddBooksAlertDialogue(),
                      barrierDismissible: true);
                },
                child: Stack(
                  children: [
                    Image.asset('assets/Rectangle_3612.png'),
                    Positioned.fill(
                        child: Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/Group 4650.svg',
                            height: 20,
                            width: 20,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Add Books',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
