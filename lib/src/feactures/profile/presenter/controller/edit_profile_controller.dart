import 'dart:io';

import 'package:app_receitas/src/feactures/profile/domain/entities/profile_entity.dart';
import 'package:app_receitas/src/feactures/profile/domain/repositories/profile_repository.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends ChangeNotifier {
  final ProfileRepository _repository;

  EditProfileController(this._repository);

  File? image;
  ProfileEntity? profile;

  void init(context) async {
    final arguments = ModalRoute.of(context)!.settings.arguments;
    profile = arguments as ProfileEntity;
    notifyListeners();
  }

  Future<void> updateImageProfile(String userID, String path) async {
    await _repository.updateImageProfile(userID, path);
  }

  Future<void> pickImageLogo() async {
    final fileImage = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 50);

    image = File(fileImage!.path);

    notifyListeners();
  }

  void removeImage() {
    image = null;
    notifyListeners();
  }
}
