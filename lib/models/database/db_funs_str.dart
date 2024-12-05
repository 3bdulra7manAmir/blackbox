
import 'package:black_box/const/const.dart';
import 'package:black_box/models/database/db_init.dart';
import 'package:black_box/models/log_saver/log_txt_saver.dart';
import 'package:black_box/modules/home/home.dart';
import 'package:black_box/modules/login/cubit/cubit.dart';
import 'package:isar/isar.dart';
import 'package:black_box/models/database/db.dart';
import 'package:logger/logger.dart';

//Isar Database Object Creation - so we could use an instance of the DataBase.
//And it is Global not in a Spesific class so we don't need to create it in every class.


class DBopsStorage
{

Isar isar = DBinit.isar;
var logger = Logger();
List<Map<String, dynamic>> logEntries = [];



// C R E A T - I N S E R T - A D D...
Future<void> addItem(Items itemStore, New_Item itemSpecs) async
{
  //Save it to the DataBase
  isar.writeTxnSync(() => isar.items.putSync(itemStore));
  logger.i('addItem function called with id: ${itemStore.item_ID} \t ${itemSpecs.itemName.toString()} \t ${itemSpecs.itemBrand.toString()} \t ${itemStore.sNumber.toString()} \t ${itemSpecs.itemPlace.toString()} \t ${LoginCubit.currentlyLoggedInUsername ?? Home.defaultUserName} \t ${MyDateTimeClass.formattedDate}');
  logAndSave(Action: "AddItems", id: itemStore.item_ID.toString(), itemName: itemSpecs.itemName, itemBrand: itemSpecs.itemBrand, serialNumber: itemStore.sNumber, itemPlace: itemSpecs.itemPlace, userName: LoginCubit.currentlyLoggedInUsername ?? Home.defaultUserName, dateAndTime: MyDateTimeClass.formattedDate);

}


// Add List of Items Not a Single One //Due to The Read Data From an Excel Sheet
Future<void> addItems(List<Items> itemStore, List<New_Item> itemSpecs) async
{
  final isar = Isar.getInstance(); // Get the Isar instance

  await isar?.writeTxn(() async
  {
    await isar.items.putAll(itemStore); // putAll expects a list
  });

  if (itemStore != 0 && itemSpecs != 0) {
  for (var item in itemStore) {
    print('Item added: ${item.item_ID}, ${item.}, ${item.brand}, ${item.serialNumber}, ${item.Places}');
  }
  
  for (var item in itemSpecs) {
    print('Item added: ${item.item_ID}, ${item.name}, ${item.brand}, ${item.serialNumber}, ${item.Places}');
  }
}

  //logger.i('addItem function called with id: ${isar?.storages.} \t ${itemStore.itemType.toString()} \t ${itemStore.brand.toString()} \t ${itemStore.color.toString()} \t ${itemStore.serialNumber.toString()} \t ${itemStore.destnation.toString()} \t ${LoginCubit.currentlyLoggedInUsername} \t $DateandTime');
  //logAndSave(Action: "AddItems", id: itemStore.id.toString(), itemType: itemStore.itemType, brand: itemStore.brand, color: itemStore.color, serialNumber: itemStore.serialNumber, destination: itemStore.destnation, username: LoginCubit.currentlyLoggedInUsername, dateAndTime: DateandTime);
}


// R E A D
final List<Items> currentItems = [];
Future<List<Items>> fetchItems() async
{
  // fetch All items
  List<Items> fetchItems = await isar.items.where().findAll(); //returns all of em
  currentItems.clear(); //Clear The items list
  currentItems.addAll(fetchItems); // fetch then add all of em into the list
  return fetchItems;
}

// U P D A T E
Future<void> updateItem(int id, String itemStore) async
{
  // fetch All items
  final existingItems = await isar.items.get(id); //
  
  if (existingItems != null){
    existingItems.itemType = itemStore;
    isar.writeTxnSync(() => isar.items.putSync(existingItems));
  }
}

// D E L E T E
Future<void> deleteItem(int id) async
{
  isar.writeTxnSync(() => isar.items.deleteSync(id));
}

}
