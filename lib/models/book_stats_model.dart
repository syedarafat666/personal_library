// To parse this JSON data, do
//
//     final booksStats = booksStatsFromJson(jsonString);

import 'dart:convert';

BooksStatsModel booksStatsFromJson(String str) => BooksStatsModel.fromJson(json.decode(str));

String booksStatsToJson(BooksStatsModel data) => json.encode(data.toJson());

class BooksStatsModel {
    int totalFinished;
    int totalReading;
    int totalBooks;

    BooksStatsModel({
        required this.totalFinished,
        required this.totalReading,
        required this.totalBooks,
    });

    factory BooksStatsModel.fromJson(Map<String, dynamic> json) => BooksStatsModel(
        totalFinished: json["totalFinished"],
        totalReading: json["totalReading"],
        totalBooks: json["totalBooks"],
    );

    Map<String, dynamic> toJson() => {
        "totalFinished": totalFinished,
        "totalReading": totalReading,
        "totalBooks": totalBooks,
    };
}
