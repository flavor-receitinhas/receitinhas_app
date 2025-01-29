import 'package:app_receitas/src/core/services/api/api_recipes.dart';
import 'package:app_receitas/src/features/profile/domain/dtos/profile_dto.dart';
import 'package:app_receitas/src/features/profile/domain/entities/profile_entity.dart';
import 'package:app_receitas/src/features/profile/domain/mappers/profile_mapper.dart';
import 'package:app_receitas/src/features/profile/domain/repositories/profile_repository.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

class ProfileRepositoryImp extends ProfileRepository {
  final ProfileMappper _mapper;
  final ApiRecipes _apiRecipes;

  ProfileRepositoryImp(
    this._apiRecipes,
    this._mapper,
  );

  String path = 'profile';

  @override
  Future<ProfileEntity> getProfile(String userID) async {
    final result = await _apiRecipes.get(
      path: '/$path/$userID',
    );
    return _mapper.fromMap(result);
  }

  @override
  Future<void> updateImageProfile(String userID, String imagePath) async {
    final data = {
      "file": await MultipartFile.fromFile(imagePath,
          contentType: MediaType('image', 'jpg')),
    };
    await _apiRecipes.put(
      path: '/$path/$userID/image',
      body: data,
      isformData: true,
    );
  }

  @override
  Future<void> updateProfile(
      {required String userId, required ProfileDto profileDto}) async {
    await _apiRecipes.post(
      path: '$path/$userId',
      body: profileDto.toMap(),
    );
  }
}
