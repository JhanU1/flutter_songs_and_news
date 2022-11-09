import 'package:flutter/material.dart';

class Song {
  int id;
  String name;
  MaterialColor color;
  String linkImage;
  Song(
      {required this.name,
      required this.color,
      required this.id,
      required this.linkImage});
}
