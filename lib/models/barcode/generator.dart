import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class BarcodeExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('صفحة انشاء الـ Barcode'),),
        body:
        // MultiBlocProvider(
        //   providers:
        //   [
        //     BlocProvider(
        //     create: (context)
        //     {
        //       final cubit = DashBoardCubit();
        //       //cubit.add().; // Call loadItems when the cubit is created
        //       return cubit;
        //     },
        //   ),
        //   // Add other providers if needed
        //   ],
          //child:
          Directionality(
            textDirection: TextDirection.rtl,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: EdgeInsets.all(45),
                  child: Column(
                    children:
                  [
                    Text("Search For a Barcode"),
                      SizedBox(width: 35,),
                    Container
                    (
                      width: 350,
                      child: SearchBar
                      (
                          //controller: ,
                          //elevation: ,
                          hintText: "ادخل سريال الـ Barcode المراد البحث عنه",
                          keyboardType: TextInputType.text,
                          //onSubmitted: ,
                          //backgroundColor: ,
                      ),
                    ),
                    SizedBox(height: 40,),
                  Row(
                    children:
                    [
                    Container(
                      width: 400,
                      height: 100,
                      child: BarcodeWidget(
                        barcode: Barcode.code128(), // Choose the barcode type
                        data: '123456789', // Data to encode
                        drawText: true,
                        width: 200, // Width of the barcode
                        height: 80, // Height of the barcode
                        color: Colors.black, // Barcode color
                        //background: Colors.white, // Background color
                      ),
                    ),
                    ],
                  ),
                    ],
                  ),
                
                ),
              ),
            ),
          ),
        ),
    );
  }
}
