// To parse this JSON data, do
//
//     final addBookModel = addBookModelFromJson(jsonString);

import 'dart:convert';

AddBookModel addBookModelFromJson(String str) => AddBookModel.fromJson(json.decode(str));

String addBookModelToJson(AddBookModel data) => json.encode(data.toJson());

class AddBookModel {
    String bookname;
    String authorname;
    String publishyear;
    String totalpages;
    String totalread;
    String bookstatus;

    AddBookModel({
        required this.bookname,
        required this.authorname,
        required this.publishyear,
        required this.totalpages,
        required this.totalread,
        required this.bookstatus,
    });

    factory AddBookModel.fromJson(Map<String, dynamic> json) => AddBookModel(
        bookname: json["bookname"],
        authorname: json["authorname"],
        publishyear: json["publishyear"],
        totalpages: json["totalpages"],
        totalread: json["totalread"],
        bookstatus: json["bookstatus"],
    );

    Map<String, dynamic> toJson() => {
        "bookname": bookname,
        "authorname": authorname,
        "publishyear": publishyear,
        "totalpages": totalpages,
        "totalread": totalread,
        "bookstatus": bookstatus,
    };
}
