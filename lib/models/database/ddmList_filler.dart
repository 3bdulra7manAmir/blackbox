// import 'package:black_box/models/database/db.dart';
// import 'package:isar/isar.dart';

// class StorageUtils
// {
//   static Future<Map<String, List<String>>> fetchDropdownData(Isar isar) async {
//     final items = await isar.storages.where().distinctBy((e) => e.itemType).map((e) => e.itemType).toList();
//     final brands = await isar.storages.where().distinctBy((e) => e.brand).map((e) => e.brand).toList();
//     final places = await isar.storages.where().distinctBy((e) => e.Places).map((e) => e.Places).toList();

//     return {
//       'items': items, 
//       'brands': brands,
//       'places': places,
//     };
//   }
// }