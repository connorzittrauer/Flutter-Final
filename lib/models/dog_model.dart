import 'dart:async';
import 'dart:convert';
import 'dart:collection';
import "package:http/http.dart" as http;

class Dog {
  final String link;
  final String breed;
  final String info;

  Dog({required this.link, required this.breed, required this.info});

  factory Dog.fromJson(Map<String, dynamic> json) {
    return Dog(
        breed: json['message'],
        link: json['message'],
        info: json['articleBody']);
  }
}
