import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:http/http.dart';
import 'package:personal_library/controller/add_book_controller.dart';
import 'package:personal_library/controller/get_books_controller.dart';
import 'package:personal_library/controller/get_stats_controller%20.dart';
import 'package:personal_library/controller/update_book_controller.dart';
import 'package:personal_library/widgets/customer_text_feild.dart';

class AddBooksAlertDialogue extends StatefulWidget {
  const AddBooksAlertDialogue({
    super.key,
  });

  @override
  State<AddBooksAlertDialogue> createState() => _AddBooksAlertDialogueState();
}

class _AddBooksAlertDialogueState extends State<AddBooksAlertDialogue> {
  final AddBookController addBookController = Get.put(AddBookController());

  final UpdateBookController updateBookController =
      Get.put(UpdateBookController());

  final BooksStatsController booksStatsController =
      Get.put(BooksStatsController());

  final MyBooksController myBooksController = Get.put(MyBooksController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AlertDialog(
        title: const Text('Add Book'),
        content: Column(
          children: [
            CustomerTextFeild(
              textController: addBookController.bookNameController,
              hintText: 'Book Name',
            ),
            const SizedBox(
              height: 10,
            ),
            CustomerTextFeild(
                textController: addBookController.authorkNameController,
                hintText: 'Author Name'),
            const SizedBox(
              height: 10,
            ),
            CustomerTextFeild(
                keyboardType: TextInputType.number,
                textController: addBookController.pagesController,
                hintText: 'Book Total Pages'),
            const SizedBox(
              height: 10,
            ),
            CustomerTextFeild(
                keyboardType: TextInputType.number,
                textController: addBookController.totalPagesReadController,
                hintText: 'Total Pages Read'),
            const SizedBox(
              height: 10,
            ),
            CustomerTextFeild(
                keyboardType: TextInputType.number,
                textController: addBookController.publishingYearController,
                hintText: 'Publising Year'),
            const SizedBox(
              height: 10,
            ),
            CustomerTextFeild(
                textController: addBookController.bookStatusController,
                hintText: 'Please select your book status'),
          ],
        ),
        actions: [
          InkWell(
            onTap: () {
              addBookController
                  .addBook()
                  .then((value) => booksStatsController.getStats())
                  .then((value) => myBooksController.fetchBooks());
            },
            child: Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(25)),
              child: const Center(
                  child: Text(
                'Add Book',
                style: TextStyle(color: Colors.white),
              )),
            ),
          )
        ],
      ),
    );
  }
}
