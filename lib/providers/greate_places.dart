import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/place.dart';
import '../helpers/db_helper.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String ttl, File img) {
    final newPlace = Place(
      id: DateTime.now().toString(),
      image: img,
      title: ttl,
      location: null,
    );
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert('userPlaces', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image,
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('userPlaces');
    _items = dataList
        .map(
          (item) => Place(
            id: item['id'],
            title: item['title'],
            location: null,
            image: File(
              item['image'],
            ),
          ),
        )
        .toList();
    notifyListeners();
  }
}
