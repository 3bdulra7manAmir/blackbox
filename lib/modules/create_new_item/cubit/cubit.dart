import 'package:black_box/models/database/db_init.dart';
import 'package:black_box/modules/create_new_item/cubit/database_logic.dart';
import 'package:black_box/modules/create_new_item/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';

Isar isar = DBinit.isar;

class CreateNewItemCubit extends Cubit<CreateNewItemStates>
{
CreateNewItemCubit() : super(Initialize_Create_NewItem_State());
static CreateNewItemCubit get(context) => BlocProvider.of(context);

  Future<void> New_Added_item({
    String? ItemName,        // Type Column (nullable)
    String? ItemBrand,       // Brand Column (nullable)
    String? ItemPlaces,  // Destination Column (nullable)
  }) async {
    final NewItem = Non_Offical_Items_List()
      ..NewItem_Name = ItemName
      ..NewItem_Brand = ItemBrand
      ..NewItem_Place = ItemPlaces;

      // Save the item to the database
    await CreateNewItemLogic().new_Added_Item(NewItem);
    emit(Add_InThe_Items_List());
  }


  void update()
  {
    emit(Update_InThe_Items_List());
  }

  Future<void> delete({int? id}) async
  {
    await CreateNewItemLogic().new_Delete_Item(id!);
    emit(Remove_InThe_Items_List());
  }

}