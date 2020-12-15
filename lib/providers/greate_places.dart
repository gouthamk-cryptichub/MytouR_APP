import 'dart:io';

import 'package:flutter/foundation.dart';

import '../models/place.dart';

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
  }
}
