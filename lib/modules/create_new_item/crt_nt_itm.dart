// ignore_for_file: sized_box_for_whitespace

import 'package:black_box/const/const.dart';
import 'package:black_box/modules/create_new_item/cubit/cubit.dart';
import 'package:black_box/modules/create_new_item/cubit/states.dart';
import 'package:black_box/utils/appbar.dart';
import 'package:black_box/utils/button.dart';
import 'package:black_box/utils/drawer.dart';
import 'package:black_box/utils/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AddItemDashBoard extends StatefulWidget
{
  const AddItemDashBoard({super.key});

  @override
  State<AddItemDashBoard> createState() => _AddItemDashBoardState();
}

class _AddItemDashBoardState extends State<AddItemDashBoard>
{

TextEditingController itemController = TextEditingController();
TextEditingController brandController = TextEditingController();
TextEditingController PlacesController = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    return BlocProvider<CreateNewItemCubit>(
      
      create: (BuildContext context) => CreateNewItemCubit(),
      child: BlocConsumer<CreateNewItemCubit, CreateNewItemStates>(
        listener: (context, state){},
        builder: (context, state)
        {
        return SafeArea(
          child: Scaffold(
            appBar: defaultAppBar(appBarTitle: "صفحة إضافة صنف جديد", appbarColor: Specs().cGray_400, elevation: 3),
            drawer: defaultDrawer(context),
            body: 
            // Container(
            //   decoration: const BoxDecoration(
            //     image: DecorationImage(image: AssetImage("assets/images/tmc.png"))
            //   ),
              //child: 
              Padding(
                padding: const EdgeInsets.all(15),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        //ADD
                        children: [
                        Row(
                          children: [
                            const Text("الصنف:"),
                            const SizedBox(width: 20,),
                            defaultTextField(
                              containerWidth: 150,
                              inputType: TextInputType.text,
                              textController: itemController,
                            ),
                            const SizedBox(width: 50,),
                            const Text("النوع:"),
                            const SizedBox(width: 20,),
                            defaultTextField(
                              containerWidth: 150,
                              inputType: TextInputType.text,
                              textController: brandController,
                            ),
                            const SizedBox(width: 50,),
                            const Text("مكان التخزين:"),
                            const SizedBox(width: 20,),
                            defaultTextField(
                              containerWidth: 150,
                              inputType: TextInputType.text,
                              textController: PlacesController,
                            ),
                            const SizedBox(width: 50,),
                            defaultButton(btnText: "إضافة", btnFunction: ()
                            {
                              //print({itemController.text}); //here
                              //print({brandController.text}); //here
                              CreateNewItemCubit.get(context).New_Added_item(ItemName: itemController.text, ItemBrand: brandController.text, ItemPlaces: PlacesController.text); //here
                              
                            }),
                            const SizedBox(width: 20,),
                            defaultButton(btnText: "حذف", btnFunction: ()
                            {
                              print({itemController.text});
                              print({brandController.text});
                              CreateNewItemCubit.get(context).delete(); //here // Could be an Issue!!
                            }),
                          ],
                        ),
                        const SizedBox(height: 30,),
                                const SizedBox(height: 15,),
                                Container( //SEPERATOR
                  width: double.infinity,
                  height: 1,
                  child: const ColoredBox(color: Colors.black),
                                ),
                                
                    ],
                  ),
                  ]),
                ),
                    ),
            ),
        );
      },
    ),
  );
    //);
  }
}