import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class FileProcess {
  static bool isFolderCreated = false;
  static Directory? directory;

  static checkDocumentFolder() async {
    try {
      if (!isFolderCreated) {
        directory = await getApplicationDocumentsDirectory();
        await directory!.exists().then((value) {
          if (value) directory!.create();
          isFolderCreated = true;
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<File> createFile(String base64str) async {
    //final base64str = base64str;
    // Convert to UriData
    var  data = Uri.parse(base64str).data;

// You can check if data is normal base64 - should return true
    print(data!.isBase64);

// Will returns your image as Uint8List
    Uint8List myImage = data.contentAsBytes();


    //Uint8List bytes = base64.decode(base64str);
    await checkDocumentFolder();
    String dir =
        directory!.path + "/" + "tmed" + ".pdf";
    File file = new File(dir);
    if (!file.existsSync()) file.create();
    await file.writeAsBytes(myImage);
    print(file.path);
    openFile(file.path);
    return file;
  }

  static void openFile(String fileName) {
    String dir =
        directory!.path + "/${fileName}.pdf";
    OpenFile.open(dir);
  }

}