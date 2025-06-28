import 'dart:io';
import 'package:api_manager/api/handler/api_error.dart';
import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/features/onboarding/data/mappers/validate_user_entity.dart';
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
  StateManager stateUpdateImage = StateManager.initial;
  StateManager stateUpdateProfile = StateManager.initial;
  StateManager stateValidateName = StateManager.initial;
  String errorUpdateMessage = '';
  ValidateUserEntity? validateUserEntity;

  Map<String, dynamic> argumentsMap = {};

  @override
  Future<void> init(Map<String, dynamic> arguments) => handleTry(
    call: () async {
      argumentsMap = arguments;
      userNameController.text = Global.profile?.name ?? '';
      profile = arguments['profile'] as ProfileEntity;
      biographyController.text = profile!.biography;
    },
  );

  Future<void> updateImageProfile() async {
    if (image == null) return;
    try {
      stateUpdateImage = StateManager.loading;
      await _repository.updateImageProfile(profile!.userId, image!.path);
      stateUpdateImage = StateManager.done;
    } catch (e) {
      if (e is ApiError) {
        errorUpdateMessage = e.message;
      } else {
        errorUpdateMessage = 'An unexpected error occurred: $e';
      }
      stateUpdateImage = StateManager.error;
    }
  }

  Future<void> pickImageLogo() async {
    final fileImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (fileImage == null) {
      return;
    }
    image = File(fileImage.path);
    isRemoveImage = false;
    notifyListeners();
  }

  Future<void> updateProfile(ProfileEntity profile) async {
    try {
      stateUpdateProfile = StateManager.loading;
      await _repository.updateProfile(
        userId: profile.userId,
        profileDto: ProfileDto(
          name: userNameController.text.trim(),
          biography: biographyController.text.trim(),
        ),
      );
      Global.profile?.name = userNameController.text.trim();
      stateUpdateProfile = StateManager.done;
    } catch (e) {
      if (e is ApiError) {
        errorUpdateMessage = e.message;
      } else {
        errorUpdateMessage = 'An unexpected error occurred: $e';
      }
      stateUpdateProfile = StateManager.error;
    }
  }

  Future<void> validateUser() async {
    try {
      stateValidateName = StateManager.loading;
      validateUserEntity = await _onBoardingRepository.validateUser(
        userID: profile!.userId,
        name: userNameController.text.trim(),
      );
      stateValidateName = StateManager.done;
    } catch (e) {
      stateValidateName = StateManager.error;
    }
    notifyListeners();
  }

  void removeImage() {
    image = File('');
    isRemoveImage = true;
    profile!.image = null;
    notifyListeners();
  }
}
