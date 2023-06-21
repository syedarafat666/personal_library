import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_library/controller/get_books_controller.dart';
import 'package:personal_library/controller/get_stats_controller%20.dart';
import 'package:personal_library/controller/update_book_controller.dart';
import 'package:personal_library/widgets/customer_text_feild.dart';

class UpdateBooksAlertDialogue extends StatefulWidget {
  const UpdateBooksAlertDialogue({super.key});

  @override
  State<UpdateBooksAlertDialogue> createState() =>
      _UpdateBooksAlertDialogueState();
}

class _UpdateBooksAlertDialogueState extends State<UpdateBooksAlertDialogue> {
  final UpdateBookController updateBookController =
      Get.put(UpdateBookController());

  final BooksStatsController booksStatsController =
      Get.put(BooksStatsController());

  TextEditingController bookIdController = TextEditingController();

  final MyBooksController myBooksController = Get.put(MyBooksController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AlertDialog(
        title: const Text('Update Book'),
        content: Column(
          children: [
            CustomerTextFeild(
              textController: updateBookController.bookNameController,
              hintText: 'Book Name',
            ),
            const SizedBox(
              height: 10,
            ),
            CustomerTextFeild(
                textController: updateBookController.authorkNameController,
                hintText: 'Author Name'),
            const SizedBox(
              height: 10,
            ),
            CustomerTextFeild(
                keyboardType: TextInputType.number,
                textController: updateBookController.totalPagesReadController,
                hintText: 'Total Pages Read'),
            const SizedBox(
              height: 10,
            ),
            CustomerTextFeild(
                textController: updateBookController.bookStatusController,
                hintText: 'Please select your book status'),
          ],
        ),
        actions: [
          InkWell(
            onTap: () {
              updateBookController.updateBook(60);
              myBooksController.fetchBooks();
            },
            child: Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(25)),
              child: const Center(
                  child: Text(
                'Update Book',
                style: TextStyle(color: Colors.white),
              )),
            ),
          )
        ],
      ),
    );
  }
}
