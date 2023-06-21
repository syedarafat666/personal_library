import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_library/controller/delete_book_controller.dart';
import 'package:personal_library/controller/get_books_controller.dart';
import 'package:personal_library/widgets/update_book_alert_dialogue.dart';

class MyBooksScreen extends StatefulWidget {
  const MyBooksScreen({super.key});

  @override
  State<MyBooksScreen> createState() => _MyBooksScreenState();
}

class _MyBooksScreenState extends State<MyBooksScreen> {
  final MyBooksController myBooksController = Get.put(MyBooksController());
  final DeleteBookController deleteBookController = Get.put(DeleteBookController());
  TextEditingController bookIdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Books'),
        ),
        body: Obx(
          () => myBooksController.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: myBooksController.booksList.length,
                  itemBuilder: (context, index) {
                    var book = myBooksController.booksList[index];
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: ExpansionTile(
                          title: Text(
                            book.bookName,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          children: [
                            DataTable(
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                ),
                                dataTextStyle: TextStyle(color: Colors.white),
                                columnSpacing: 50,
                                columns: [
                                  DataColumn(
                                    label: Text(
                                      'Book\nID',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  DataColumn(
                                      label: Text(
                                    'Book\nAuthor',
                                    style: TextStyle(color: Colors.white),
                                  )),
                                  DataColumn(
                                      label: Text(
                                    'Total\nPages',
                                    style: TextStyle(color: Colors.white),
                                  )),
                                  DataColumn(
                                      label: Text(
                                    'Year',
                                    style: TextStyle(color: Colors.white),
                                  )),
                                ],
                                rows: [
                                  DataRow(cells: [
                                    DataCell(Text(book.bookId.toString())),
                                    DataCell(Text(book.bookAuthor)),
                                    DataCell(Text(book.totalPages.toString())),
                                    DataCell(
                                        Text(book.publishingYear.toString())),
                                  ]),
                                ]),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) =>
                                              UpdateBooksAlertDialogue(),
                                          barrierDismissible: true);
                                    },
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.grey,
                                    )),
                                IconButton(
                                    onPressed: () {
                                      deleteBookController.deleteBook(bookIdController.text);
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ));
  }
}

// TableRow _tableRow = const TableRow(
//   children: [
//     Padding(
//       padding: EdgeInsets.all(8.0),
//       child: Column(
//         children: [
//           Text('Book ID'),
//         ],
//       ),
//     ),
//     Padding(
//       padding: EdgeInsets.all(8.0),
//       child: Text('Book Author'),
//     ),
//     Padding(
//       padding: EdgeInsets.all(8.0),
//       child: Text('Total Pages'),
//     ),
//     Padding(
//       padding: EdgeInsets.all(8.0),
//       child: Text('Year'),
//     )
//   ]
// );



/*---------------------------------Column(
                          children: [
                            Text(
                              book.bookName,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),-------------------------------*/




// ignore_for_file: must_be_immutable

// import 'package:flutter/material.dart';
// import 'package:personal_library/models/books_model.dart';
// import 'package:personal_library/services/api_servcies.dart';

// class MyBooksScreen extends StatefulWidget {
//   const MyBooksScreen({super.key});

//   @override
//   State<MyBooksScreen> createState() => _MyBooksScreenState();
// }

// class _MyBooksScreenState extends State<MyBooksScreen> {
//   List<BooksModel> booksList = [];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Books'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: FutureBuilder(
//               future: ApiServices().getbooksList(),
//               builder: (context, AsyncSnapshot<List<BooksModel>> snapshot){
//               if(!snapshot.hasData){
//                 return Center(child: CircularProgressIndicator());
//               }else{
//                 return ListView.builder(
//                   itemCount: 10,
//                   itemBuilder: (context, index){
//                     return Card(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text('Hi there')
//                         ],
//                       ),
//                     );
//                   });
//               }
//             }),
//           )
//         ],
//       ),
//     );
//   }
// }

// class ReuseableRow extends StatelessWidget {
//   String title, value;
//   ReuseableRow({super.key, required this.title, required this.value});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(title,
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold
//                 ),),
//                 Text(value),
//                 ],
//               ),
//     );
//   }
// }










/*---------------------------------------------------------------------- */




// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:personal_library/models/books_model.dart';
// import 'package:personal_library/services/api_servcies.dart';

// class MyBooksScreen extends StatefulWidget {
//   const MyBooksScreen({super.key});

//   @override
//   State<MyBooksScreen> createState() => _MyBooksScreenState();
// }

// class _MyBooksScreenState extends State<MyBooksScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Books'),
//       ),
//       body: ListView.builder(
//           itemCount: 20,
//           itemBuilder: (context, index) {
//             return Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 10),
//                 child: InkWell(
//                   onTap: () async {
//                     Expanded(
//             child: FutureBuilder(
//               future: ApiServices().getbooksList(),
//               builder: (context, AsyncSnapshot<List<BooksModel>> snapshot){
//               if(!snapshot.hasData){
//                 return Center(child: CircularProgressIndicator());
//               }else{
//                 return ListView.builder(
//                   itemCount: 10,
//                   itemBuilder: (context, index){
//                     return Card(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
                          
//                         ],
//                       ),
//                     );
//                   });
//               }
//             }),
//           );
//                   },
//                   child: Container(
//                       padding: EdgeInsets.symmetric(horizontal: 10),
//                       height: 60,
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         border: Border.all(
//                           width: 1,
//                         ),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text('Book Name'),
//                         ],
//                       )),
//                 ),
//               ),
//             );
//           }),
//     );
//   }
// }

/*-------------------------------------------------------------*/

// import 'package:flutter/material.dart';

// class MyBooksScreen extends StatefulWidget {
//   @override
//   _MyMyBooksScreenState createState() => _MyMyBooksScreenState();
// }

// class _MyMyBooksScreenState extends State<MyBooksScreen> {
//   List<Item> _items = [
//     Item(
//       headerValue: 'Header 1',
//       expandedValue: 'Expanded 1',
//     ),
//     Item(
//       headerValue: 'Header 2',
//       expandedValue: 'Expanded 2',
//     ),
//     // Add more items as needed
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Books'),
//       ),
//       body: ListView(
//         children: _items.map<Widget>((Item item) {
//           return ExpansionPanelList(
//             elevation: 1,
//             expandedHeaderPadding: EdgeInsets.all(0),
//             expansionCallback: (int index, bool isExpanded) {
//               setState(() {
//                 item.isExpanded = !isExpanded;
//               });
//             },
//             children: [
//               ExpansionPanel(
//                 headerBuilder: (BuildContext context, bool isExpanded) {
//                   return ListTile(
//                     title: Text(item.headerValue),
//                   );
//                 },
//                 body: ListTile(
//                   title: Text(item.expandedValue),
//                 ),
//                 isExpanded: item.isExpanded,
//               ),
//             ],
//           );
//         }).toList(),
//       ),
//     );
//   }
// }

// class Item {
//   Item({
//     required this.headerValue,
//     required this.expandedValue,
//     this.isExpanded = false,
//   });

//   String headerValue;
//   String expandedValue;
//   bool isExpanded;
// }
