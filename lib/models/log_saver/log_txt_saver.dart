import 'dart:io';
import 'package:logger/logger.dart';

var logger = Logger();

// Function to get the directory for storing the file
Future<String> _getLocalFilePath() async {
  final directory = Directory.current; // For a temporary directory
  return '${directory.path}/logfile.txt';
}

// Function to write data to the file
Future<void> writeLogToFile(String logData) async {
  final filePath = await _getLocalFilePath();
  print('Saving log to: $filePath'); // Debug print

  final file = File(filePath);

  // Check if the file exists, and if not, create it
  if (!await file.exists()) {
    await file.create();
  }

  // Append log data to the file
  await file.writeAsString('$logData\n', mode: FileMode.append);
}

// Function to call when you need to log data
void logAndSave({String? Action,  String? id, String? itemName, String? itemBrand, String? serialNumber, String? itemPlace, String? userName, var dateAndTime}) async
{
  final logData = '${Action} Called with,,, id: $id \t $itemType \t $brand \t $color \t $serialNumber \t $destination \t $userName \t $dateAndTime';
  // Log the data using logger
  logger.i(logData);
  // Save the log data to a file
  await writeLogToFile(logData);
}
