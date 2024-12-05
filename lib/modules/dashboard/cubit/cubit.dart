// ignore_for_file: unused_local_variable, dead_code, unused_import

import 'dart:ui' as ui; // Ensure 'ui' is correctly imported
import 'package:black_box/models/database/db.dart';
import 'package:black_box/models/database/db_funs_str.dart';
import 'package:black_box/models/database/db_init.dart';
import 'package:black_box/modules/dashboard/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:barcode/barcode.dart'; // Import the barcode package
import 'package:flutter_svg/flutter_svg.dart';
import 'package:isar/isar.dart';
import 'dart:io'; // For saving barcode as an image
import 'dart:typed_data';

Isar isar = DBinit.isar;

class DashBoardCubit extends Cubit<DashBoardStates>
{
  DashBoardCubit() : super(InitializeDashBoardState());
  static DashBoardCubit get(context) => BlocProvider.of(context);

  // Convert SVG to PNG
  Future<Uint8List> svgToPng(String svgString) async
  {
    final DrawableRoot svgDrawableRoot = await svg.fromSvgString(svgString, '');

    final recorder = ui.PictureRecorder();
    final size = ui.Size(300, 80);  // Width and Height of the PNG
    final canvas = ui.Canvas(recorder, ui.Rect.fromLTWH(0, 0, size.width, size.height));

    // Paint the SVG DrawableRoot onto the Canvas
    svgDrawableRoot.draw(canvas, ui.Rect.fromLTWH(0, 0, size.width, size.height));

    final picture = recorder.endRecording();
    final img = await picture.toImage(size.width.toInt(), size.height.toInt());

    final byteData = await img.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

  // Add item with barcode generation and storage
  Future<void> add({
    String? type,        // Type Column (nullable)
    String? brand,       // Brand Column (nullable)
    String? color,       // Color Column (nullable)
    String? serialNumber,// SN Column (nullable)
    String? Places,  // Destination Column (nullable)
  }) async {
    final item = Items()
      ..itemType = type
      ..brand = brand
      ..serialNumber = serialNumber
      ..Places = Places;

    // Generate the barcode if the serial number exists
    if (serialNumber != null && serialNumber.isNotEmpty)
    {
      final barcode = Barcode.code128();
      final svgString = barcode.toSvg(serialNumber, width: 300, height: 80);

      // Assign SVG data to the item
      item.svgData = svgString;

      // Save the SVG file
      await _saveSvgToFile(serialNumber, svgString);

      // Convert SVG to PNG and assign PNG data to item
      final pngBytes = await svgToPng(svgString);
      item.barcodePng = pngBytes;

      // Save the PNG file
      await _savePngToFile(serialNumber, pngBytes);
    }

    // Save the item to the database
    await DBopsStorage().addItem(item);
    emit(AddDashBoardState());
  }

  // Save SVG file
  Future<void> _saveSvgToFile(String serialNumber, String svgString) async
  {
    final directory = Directory('barcodes');
    final svgFilePath = 'barcodes/$serialNumber.svg';
    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }
    final svgFile = File(svgFilePath);
    await svgFile.writeAsString(svgString);
  }

  // Save PNG file
  Future<void> _savePngToFile(String serialNumber, Uint8List pngBytes) async
  {
    final pngFilePath = 'barcodes/$serialNumber.png';
    final pngFile = File(pngFilePath);
    await pngFile.writeAsBytes(pngBytes);
  }

  // PART 1: Fetch items by serial number
  Future<List<Storage>> fetchBySN(String serialNumberText) async
  {
    DBopsStorage().fetchItems();
    return await isar.storages
        .where()
        .filter()
        .serialNumberEqualTo(serialNumberText)
        .findAll();
  }

  // PART 2: Print item details
  Future<String> printItemDetails({String? serialNumberText}) async
  {
    final items = await fetchBySN(serialNumberText!);
    final item = items[0]; // Assuming you want the first item that matches
    String itemType = item.itemType ?? '';
    String brand = item.brand ?? '';
    String Places = item.Places ?? '';
    emit(ReadDashBoardState());
    return '$itemType $brand $Places';
  }

  void update() {
    emit(UpdateDashBoardState());
  }

  Future<void> delete({int? id}) async {
    await DBopsStorage().deleteItem(id!);
    emit(AddDashBoardState());
  }
}
