import 'dart:io';
import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/features/onboarding/domain/repositories/user_onboarding_repository.dart';
import 'package:app_receitas/src/features/profile/domain/dtos/profile_dto.dart';
import 'package:app_receitas/src/features/profile/domain/entities/profile_entity.dart';
import 'package:app_receitas/src/features/profile/domain/repositories/profile_repository.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_manager/export_manager.dart';

class EditProfileController extends ManagerStore {
  final ProfileRepository _repository;
  final UserOnboardingRepository _onBoardingRepository;

  EditProfileController(this._repository, this._onBoardingRepository);

  File? image;
  ProfileEntity? profile;
  TextEditingController biographyController = TextEditingController();
  bool isRemoveImage = false;
  TextEditingController userNameController = TextEditingController();

  @override
  void init(Map<String, dynamic> arguments) => handleTry(
        call: () async {
          userNameController.text = Global.profile?.name ?? '';
          profile = arguments['profile'] as ProfileEntity;
          biographyController.text = profile!.biography;
        },
      );

  Future<void> updateNameProfile() => handleTry(call: () async {
        await _onBoardingRepository.updateUserName(
          userId: Global.user!.id,
          name: userNameController.text,
        );
        Global.profile?.name = userNameController.text;
      });

  Future<void> updateImageProfile() async {
    if (image == null) return;
    await _repository.updateImageProfile(profile!.userId, image!.path);
  }

  Future<void> pickImageLogo() async {
    final fileImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (fileImage == null) {
      return;
    }
    image = File(fileImage.path);
    isRemoveImage = false;
    notifyListeners();
  }

  Future<void> updateProfile(ProfileEntity profile) async =>
      await _repository.updateProfile(
        userId: profile.userId,
        profileDto: ProfileDto(
          name: profile.name,
          biography: profile.biography,
        ),
      );

  void removeImage() {
    image = File('');
    isRemoveImage = true;
    profile!.image = null;
    notifyListeners();
  }
}
