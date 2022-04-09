import 'package:flutter/foundation.dart';

class CatBreed {
  final String name;
  final String url;

  CatBreed({
    required this.name,
    required this.url,
  });

  factory CatBreed.fromJson(Map<String, dynamic> json) {
    return CatBreed(
      name: json['name'] as String,
      url: json['image']['url'] as String,
    );
  }
}
