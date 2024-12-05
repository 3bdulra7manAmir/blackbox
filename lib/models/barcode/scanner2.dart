// import 'package:esc_pos_printer/esc_pos_printer.dart';
// import 'package:esc_pos_utils/esc_pos_utils.dart';

// // Assuming barcode scanner input is captured like text input.
// TextEditingController barcodeController = TextEditingController();

// // Example function to listen for barcode input
// void onBarcodeScanned(String barcode) {
//   print("Barcode scanned: $barcode");
//   // After barcode is scanned, trigger the print function
//   printBarcode(barcode);
// }




// // Function to print the barcode
// void printBarcode(String barcode) async {
//   final profile = await CapabilityProfile.load(); // Load printer profile
//   final printer = NetworkPrinter(PaperSize.mm80, profile);

//   final res = await printer.connect('192.168.0.100', port: 9100); // Change to your printer IP and port
//   if (res == PosPrintResult.success) {
//     printer.text('Scanned Barcode:', styles: PosStyles(align: PosAlign.center));
//     printer.barcode(Barcode.code128(barcode));  // Use appropriate barcode type
//     printer.feed(2);
//     printer.cut();
//     printer.disconnect();
//   } else {
//     print('Failed to connect to printer');
//   }
// }
