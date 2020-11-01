import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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

  void _setFavValue(bool newValue){
    isFavorite = newValue;
    notifyListeners();
  }

  Future<void> toggleFavoriteStatus() async{
    final oldStatus = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();
    final url = 'https://flutter-project-777-719f2.firebaseio.com/products/$id.json';
    try{
      final response = await http.patch(url,body: json.encode({
        'isFavorite':isFavorite,
      }));
      if(response.statusCode>=400){
        _setFavValue(oldStatus);
      }
    }catch(error){
        _setFavValue(oldStatus);
    }

  }
}
