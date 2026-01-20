import 'package:flutter/widgets.dart';

class HomeOrderProvider extends ChangeNotifier {
  final List<String> _products = const [
    'Yogurt',
    'Paneer',
    'Cheese',
    'Cow Milk',
    'Buffalo Milk',
    'Goat Milk',
    'Camel Milk',
  ];

  final List<String> _images = const [
    'https://images.pexels.com/photos/5945660/pexels-photo-5945660.jpeg',
    'https://images.pexels.com/photos/17200452/pexels-photo-17200452.jpeg',
    'https://images.pexels.com/photos/773253/pexels-photo-773253.jpeg',
    'https://images.pexels.com/photos/422218/pexels-photo-422218.jpeg',
    'https://images.pexels.com/photos/26167584/pexels-photo-26167584.jpeg',
    'https://images.pexels.com/photos/28430652/pexels-photo-28430652.jpeg',
    'https://images.pexels.com/photos/7057286/pexels-photo-7057286.jpeg',
  ];

  List<int> quantities = [0, 0, 0, 0, 0, 0, 0];

  List<String> get getProducts => _products;
  List<String> get getImages => _images;
  List<int> get getQuantities => quantities;

  void addQuantity(int index) {
    quantities[index]++;
    notifyListeners();
  }

  void removeQuantity(int index) {
    if (quantities[index] > 0) {
      quantities[index]--;
      notifyListeners();
    }
  }
}
