// To parse this JSON data, do
//
//     final booksModel = booksModelFromJson(jsonString);

import 'dart:convert';

List<BooksModel> booksModelFromJson(String str) => List<BooksModel>.from(json.decode(str).map((x) => BooksModel.fromJson(x)));

String booksModelToJson(List<BooksModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BooksModel {
    int bookId;
    String bookName;
    String bookAuthor;
    int totalPages;
    int noOfPagesRead;
    String readingStatus;
    String publishingYear;
    int userId;
    DateTime createdAt;
    DateTime updatedAt;

    BooksModel({
        required this.bookId,
        required this.bookName,
        required this.bookAuthor,
        required this.totalPages,
        required this.noOfPagesRead,
        required this.readingStatus,
        required this.publishingYear,
        required this.userId,
        required this.createdAt,
        required this.updatedAt,
    });

    factory BooksModel.fromJson(Map<String, dynamic> json) => BooksModel(
        bookId: json["book_id"],
        bookName: json["book_name"],
        bookAuthor: json["book_author"],
        totalPages: json["total_pages"],
        noOfPagesRead: json["no_of_pages_read"],
        readingStatus: json["reading_status"],
        publishingYear: json["publishing_year"],
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "book_id": bookId,
        "book_name": bookName,
        "book_author": bookAuthor,
        "total_pages": totalPages,
        "no_of_pages_read": noOfPagesRead,
        "reading_status": readingStatus,
        "publishing_year": publishingYear,
        "user_id": userId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
