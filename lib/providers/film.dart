import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';

class Film {
  final int id;
  final String name;

  const Film({
    required this.id,
    required this.name,
  });

  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }
}
