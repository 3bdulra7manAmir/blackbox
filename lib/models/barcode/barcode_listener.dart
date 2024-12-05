// import 'dart:typed_data';
// import 'package:esc_pos_printer/esc_pos_printer.dart';
// import 'package:usb_serial/usb_serial.dart';
// import 'package:esc_pos_utils/esc_pos_utils.dart';
// import 'dart:convert'; // for utf8.encode

// class UsbPrinter
// {
//   UsbPort? port;

//   // Initialize the USB port
//   Future<bool> init() async
//   {
//     List<UsbDevice> devices = await UsbSerial.listDevices();
//     if (devices.isNotEmpty)
//     {
//       port = await devices[0].create();
//       return await port!.open();
//     }
//     return false;
//   }

//   // Print text
//   Future<void> printText(String text) async
//   {
//     if (port != null)
//     {
//       final profile = await CapabilityProfile.load();
//       final printer = NetworkPrinter(PaperSize.mm80, profile);
//       await port!.write(printer.text(text, styles: PosStyles(align: PosAlign.center)));
//     }
//   }

//   // Print barcode
//   Future<void> printBarcode(String barcode) async
//   {
//     if (port != null) {
//       final profile = await CapabilityProfile.load();
//       final printer = NetworkPrinter(PaperSize.mm80, profile);
//       await port!.write(printer.barcode(Barcode.code128(utf8.encode(barcode)), width: 2, height: 100));
//     }
//   }

//   // Feed the paper
//   Future<void> feedPaper(int lines) async
//   {
//     if (port != null)
//     {
//       final profile = await CapabilityProfile.load();
//       final printer = NetworkPrinter(PaperSize.mm80, profile);
//       await port!.write(printer.feed(lines));
//     }
//   }

//   // Cut the paper
//   Future<void> cutPaper() async
//   {
//     if (port != null)
//     {
//       final profile = await CapabilityProfile.load();
//       final printer = NetworkPrinter(PaperSize.mm80, profile);
//       await port!.write(printer.cut());
//     }
//   }

//   // Close the USB port
//   Future<void> close() async
//   {
//     if (port != null)
//     {
//       await port!.close();
//     }
//   }

//   // Listen for barcode scan events
//   void listenForBarcode() async
//   {
//     List<UsbDevice> devices = await UsbSerial.listDevices();
//     if (devices.isNotEmpty)
//     {
//       UsbPort? scannerPort = await devices[0].create();
//       bool openResult = await scannerPort!.open();
//       if (openResult) {
//         // Start reading the data from the scanner
//         scannerPort.inputStream?.listen((Uint8List data)
//         {
//           String scannedData = String.fromCharCodes(data);
//           print('Scanned Barcode: $scannedData');
//           // Call the print method here
//           printBarcode(scannedData);
//         });
//       } else {
//         print('Failed to open scanner port');
//       }
//     } else {
//       print('No USB devices found for scanner');
//     }
//   }
// }

// Future<void> barPrinter() async
// {
//   print("in\tbarPrinter");
//   final usbPrinter = UsbPrinter();

//   // Initialize the printer
//   bool isConnected = await usbPrinter.init();
//   if (isConnected)
//   {
//     // Start listening for barcode scans
//     usbPrinter.listenForBarcode();
    
//     // Example of printing a static message
//     await usbPrinter.printText('Ready to scan...');
//   } else {
//     print('Failed to connect to USB printer');
//   }
// }
