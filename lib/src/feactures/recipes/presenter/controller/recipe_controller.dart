import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class RecipeController extends ChangeNotifier {
  var listMultiMedia = [];
  final Dio dio;

  RecipeController(this.dio);

  String url = 'http://192.168.1.6:8080';
  String path = '';

  void pickMultiMedia() async {
    List<XFile> listImage =
        await ImagePicker().pickMultipleMedia(imageQuality: 50);
    for (var image in listImage) {
      listMultiMedia.add(File(image.path));
    }
    notifyListeners();
  }

  void removeImage(File image) {
    listMultiMedia.removeWhere((e) => e == image);
    notifyListeners();
  }

  void sendImage() async {
    FormData imageData = FormData();
    for (var i = 0; i < listMultiMedia.length; i++) {
      imageData.files.add(MapEntry('images',
          await MultipartFile.fromFile(listMultiMedia[i], filename: '$i.jpg')));
    }
    dio.post('$url/$path', data: imageData);
  }
}
