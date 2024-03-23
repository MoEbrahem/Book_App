import 'package:book/core/utils/assets.dart';

abstract class DataView {
  static List<Map<String, dynamic>> bestseller = [
    {
      "cost": "19.99\$",
      "bookSubTitle": "J.K. Rowling",
      "assetImage": AssetsData.harrypotterCoverBook,
      "bookTitle": "Harry Potter and the Goblet of Fire",
    },
    {
      "cost": "19.99\$",
      "bookSubTitle": "Rudyard Kipling",
      "assetImage": AssetsData.customList,
      "bookTitle": "The Jungle Book",
    },
  ];
}
