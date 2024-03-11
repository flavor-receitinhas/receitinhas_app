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
  TextEditingController biographyController = TextEditingController();

  void init(context) async {
    final arguments = ModalRoute.of(context)!.settings.arguments;
    profile = arguments as ProfileEntity;
    biographyController.text = profile!.biography;
    notifyListeners();
  }

  Future<void> updateImageProfile() async {
    if (image == null) return;
    await _repository.updateImageProfile(profile!.userID, image?.path);
  }

  Future<void> pickImageLogo() async {
    final fileImage = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 50);

    image = File(fileImage!.path);

    notifyListeners();
  }

  Future<void> updateProfile(ProfileEntity profile) async {
    await _repository.updateProfile(profile);
  }

  void removeImage() {
    image = File('');
    profile!.image = null;
    notifyListeners();
  }
}
