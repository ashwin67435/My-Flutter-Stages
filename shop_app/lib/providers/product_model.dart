import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    this.id,
    this.description,
    this.imageUrl,
    this.price,
    this.title,
    this.isFavorite=false,
  });

  void toggleFavoriteStatus(){
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
