import 'dart:async';
import 'dart:convert';
import 'dart:collection';
import "package:http/http.dart" as http;

class Dog {
  final String link;
  final String breed;

  Dog({
    required this.link,
    required this.breed,
  });

  factory Dog.fromJson(Map<String, dynamic> json) {
    return Dog(
      breed: json['message'],
      link: json['message'],
    );
  }
}
