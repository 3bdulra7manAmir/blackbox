// ignore_for_file: sized_box_for_whitespace

import 'package:black_box/const/const.dart';
import 'package:black_box/modules/dashboard/cubit/cubit.dart';
import 'package:black_box/modules/dashboard/cubit/states.dart';
import 'package:black_box/utils/appbar.dart';
import 'package:black_box/utils/drawer.dart';
import 'package:black_box/utils/dropdownmenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:black_box/utils/textfield.dart';


List<String> itemsList = <String>[];
List<String> brandList = <String>[];
List<String> PlacesList = <String>[];
String defaultValue = '';

class AdminDashboard extends StatefulWidget
{
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard>
{

String dropdownitemsValue = itemsList.isNotEmpty ? itemsList.first : defaultValue; // Initialize dropdownValue here
String dropdownbrandValue = brandList.isNotEmpty ? brandList.first : defaultValue; // Initialize dropdownValue here
String dropdownPlacesValue = PlacesList.isNotEmpty ? PlacesList.first : defaultValue; // Initialize dropdownValue here

TextEditingController serialNumber = TextEditingController();
TextEditingController serialNumberRemover = TextEditingController();
TextEditingController serialNumberReader = TextEditingController();
TextEditingController serialNumberUpdate = TextEditingController();
TextEditingController id = TextEditingController();

TextEditingController returnedItem = TextEditingController();
TextEditingController returnedBrand = TextEditingController();
TextEditingController returnedColor = TextEditingController();
TextEditingController returnedPlaces = TextEditingController();

String? serialNumberText;



  @override
  Widget build(BuildContext context)
  {
    return BlocProvider<DashBoardCubit>(
      create: (BuildContext context) => DashBoardCubit(),
      child: BlocConsumer<DashBoardCubit, DashBoardStates>(
        listener: (context, state){},
        builder: (context, state)
        {
        return SafeArea(
          child: Scaffold(
            appBar: defaultAppBar(appBarTitle: "صفحة المسؤول", appbarColor: Specs().cGray_400, elevation: 3),
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
                            defultDropDownMenu(
                                wordsList: itemsList,
                                dropdownValueDefultValue: dropdownitemsValue,
                                dropDownMenuIcon: const Icon(Icons.arrow_downward),
                                elevationValue: 1,
                                underline: Container(height: 2,color: Colors.grey,),
                                textStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                onChangedFunction: (String? value) {setState(() {dropdownitemsValue = value!;});},
                                containerWidth: 130,
                                //containerHeight: 50
                              ),
                            const SizedBox(width: 50,),
                                
                            const Text("النوع:"),
                            const SizedBox(width: 20,),
                            defultDropDownMenu(
                                wordsList: brandList,
                                dropdownValueDefultValue: dropdownbrandValue,
                                dropDownMenuIcon: const Icon(Icons.arrow_downward),
                                elevationValue: 1,
                                underline: Container(height: 2,color: Colors.grey,),
                                textStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                onChangedFunction: (String? value) {setState(() {dropdownbrandValue = value!;});},
                                containerWidth: 120
                              ),
                            const SizedBox(width: 50,),
                                
                            const Text("اللون:"),
                            const SizedBox(width: 20,),
                          ],
                        ),
                        const SizedBox(height: 30,),
                        Row(
                          children: [
                        const Text("الرقم التسلسلي:"),
                        const SizedBox(width: 20,),
                        //defaultTextField(containerWidth: 200, textController: serialNumber),
                        Container(
                          width: 200,
                          child: TextField(
                            controller: serialNumber,
                            inputFormatters:[
                            SerialNumberFormatter(), // Applies the custom formatter
                          ],
                            keyboardType: TextInputType.text, // Allows both numbers and letters
                            decoration: const InputDecoration(border: OutlineInputBorder(),),
                            )
                        ),
                        const SizedBox(width: 20,),
                        const Text("مكان التواجد:"),
                        const SizedBox(width: 20,),
                        defultDropDownMenu(
                          dropdownValueDefultValue: dropdownPlacesValue,
                          dropDownMenuIcon: const Icon(Icons.arrow_downward),
                          onChangedFunction: (String? value) {setState(() {dropdownPlacesValue = value!;});},
                          elevationValue: 1,
                          wordsList: PlacesList,
                          underline: Container(height: 2,color: Colors.grey,),
                          textStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                          containerWidth: 165,
                        ),
                        const SizedBox(width: 70,),
                        ElevatedButton.icon(onPressed: () {DashBoardCubit.get(context).add
                        (
                          brand: dropdownbrandValue,
                          Places: dropdownPlacesValue,
                          type: dropdownitemsValue,
                          serialNumber: serialNumber.text 
                        );
                        serialNumber.clear(); //clears the textfield text after inserted
                        }, icon:  Icon(Icons.insert_chart), label: const Text("إدخال", style: TextStyle(color: Colors.black),), style: ElevatedButton.styleFrom(iconColor: Colors.black,)
                      ),
                  ]
                                ),
                                //ADD
                                const SizedBox(height: 15,),
                                Container( //SEPERATOR
                  width: double.infinity,
                  height: 1,
                  child: const ColoredBox(color: Colors.black),
                                ),
                                //DELETE
                                const SizedBox(height: 60,),
                                //DELETE
                                Row(
                  children: [
                        const Text("الرقم التسلسلي:"),
                        const SizedBox(width: 20,),
                        //defaultTextField(containerWidth: 200, textController: serialNumber),
                        Container(
                          width: 250,
                          child: TextField(
                            controller: serialNumberRemover,
                            inputFormatters:[
                            SerialNumberFormatter(), // Applies the custom formatter
                          ],
                            keyboardType: TextInputType.text, // Allows both numbers and letters
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text("خذف الايقونه باستخدام الرقم التسلسلي", style: TextStyle(fontSize: 15),
                                )
                              ),
                            )
                        ),
                        const SizedBox(width: 25,),
                        ElevatedButton.icon(onPressed: ()
                        {
                          //DashBoardCubit.get(context).
                          serialNumber.clear(); //clears the textfield text after inserted
                        },
                        icon: const Icon(Icons.delete), label: const Text("حذف", style: TextStyle(color: Colors.black),), style: ElevatedButton.styleFrom(iconColor: Colors.black,)
                      ),
                    ],
                      ),
                    //DELETE
                    //UPDATE
                                
                    //Still Will BE CHANGED TO TEXTFIELDS INSTEAD OF DROP DOWN MENUS
                    const SizedBox(height: 60,),
                    Container( //SEPERATOR
                      width: double.infinity,
                      height: 1,
                      child: const ColoredBox(color: Colors.black),
                    ),
                    //UPDATE
                    const SizedBox(height: 20,),
                    Row(
                      children: [
                      const Text("الرقم التسلسلي:"),
                      const SizedBox(width: 20,),
                        Container(
                          width: 250,
                          child: TextField(
                            controller: serialNumberReader,
                            inputFormatters:[
                            SerialNumberFormatter(), // Applies the custom formatter
                          ],
                            keyboardType: TextInputType.text, // Allows both numbers and letters
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text("قرأة بيانات الايقونه بواسطة الرقم التسلسلي", style: TextStyle(fontSize: 15))
                              ),
                            )
                        ),
                        const SizedBox(width: 25,),
                        ElevatedButton.icon(onPressed: ()
                        {
                          serialNumberText = serialNumberReader.text;
                          DashBoardCubit.get(context).fetchBySN(serialNumberText!);
                          //serialNumber.clear(); //clears the textfield text after inserted
                        },
                        icon: const Icon(Icons.delete), label: const Text("قرأة", style: TextStyle(color: Colors.black),), style: ElevatedButton.styleFrom(iconColor: Colors.black,)
                      ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      children: [
                        Row(
                          children: [
                            const Text("الصنف:"),
                            const SizedBox(width: 10,),
                            defaultTextField(
                              containerWidth: 155,
                              suffixIcon: const Icon(Icons.emoji_objects),
                              //textController: returnedItem., //here
                            ),
                            const SizedBox(width: 30,),
                                  
                            const Text("النوع:"),
                            const SizedBox(width: 10,),
                            defaultTextField(
                              containerWidth: 140,
                              suffixIcon: const Icon(Icons.backup_table_rounded),
                              textController: returnedBrand,
                            ),
                            const SizedBox(width: 30,),
                                  
                            const Text("اللون:"),
                            const SizedBox(width: 10,),
                            defaultTextField(
                              containerWidth: 105,
                              suffixIcon: const Icon(Icons.color_lens),
                              textController: returnedColor,
                            ),
                              const SizedBox(width: 40,),
                              Container(
                                width: 100,
                                height: 60,
                                child: TextField(
                                  controller: id,
                                  enabled: false,
                                  decoration: const InputDecoration(border: OutlineInputBorder(),),
                                ),
                              ),
                          ],
                        ),
                      ],
                        ),
                      const SizedBox(height: 30,),
                        Row(
                          children: [
                        const Text("الرقم التسلسلي:"),
                        const SizedBox(width: 20,),
                        //defaultTextField(containerWidth: 200, textController: serialNumber),
                        Container(
                          width: 200,
                          child: TextField(
                            controller: serialNumberUpdate,
                            inputFormatters:[
                            SerialNumberFormatter(), // Applies the custom formatter
                          ],
                            keyboardType: TextInputType.text, // Allows both numbers and letters
                            decoration: const InputDecoration(border: OutlineInputBorder(),),
                            )
                        ),
                        const SizedBox(width: 20,),
                        const Text("مكان التواجد:"),
                        const SizedBox(width: 20,),
                        defaultTextField(
                              containerWidth: 200,
                              suffixIcon: const Icon(Icons.emoji_objects),
                              textController: returnedPlaces,
                            ),
                        const SizedBox(width: 50,),
                        ElevatedButton.icon(onPressed: () {
                          //DashBoardCubit.get(context).add
                        // (
                        //   brand: dropdownbrandValue,
                        //   color: dropdowncolorValue,
                        //   Places: dropdownPlacesValue,
                        //   type: dropdownitemsValue,
                        //   serialNumber: serialNumber.text 
                        // );
                        serialNumberUpdate.clear(); //clears the textfield text after inserted
                        }, icon: const Icon(Icons.insert_chart), label: const Text("تحديث", style: TextStyle(color: Colors.black),), style: ElevatedButton.styleFrom(iconColor: Colors.black,)
                      ),
                  ]
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