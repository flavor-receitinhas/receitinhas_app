import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/services/api/api_recipes.dart';
import 'package:app_receitas/src/core/services/api/api_response.dart';
import 'package:app_receitas/src/core/services/api/response_request_mapper.dart';
import 'package:app_receitas/src/feactures/profile/domain/entities/profile_entity.dart';
import 'package:app_receitas/src/feactures/profile/domain/mappers/profile_mapper.dart';
import 'package:app_receitas/src/feactures/profile/domain/repositories/profile_repository.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

class ProfileRepositoryImp extends ProfileRepository {
  final ProfileMappper _mapper;
  final ApiRecipes _apiRecipes;
  final ApiResponse _apiResponse;
  final ResponseRequestMapper _responseRequestMapper;

  ProfileRepositoryImp(this._apiRecipes, this._mapper, this._apiResponse,
      this._responseRequestMapper);

  String url = Global.dnsApi;
  String path = 'profile';

  @override
  Future<ProfileEntity> getProfile(String userID) async {
    final result = await _apiRecipes.get(
      path: '$url/$path/$userID',
    );

    return _mapper.fromMap(result);
  }

  @override
  Future<void> updateImageProfile(String userID, String? imagePath) async {
    Dio dio = di();
    final data = imagePath!.isEmpty
        ? FormData.fromMap({})
        : FormData.fromMap({
            "file": await MultipartFile.fromFile(imagePath,
                contentType: MediaType('image', 'jpg')),
          });
    final response = await dio.put(
      '$url/$path/$userID/image',
      data: data,
      options: Options(
        headers: {
          'Authorization': Global.token,
        },
      ),
    );

    _apiResponse.handleResponse(_responseRequestMapper.fromDio(response));
  }

  @override
  Future<void> updateProfile(ProfileEntity profileEntity) async {
    _apiRecipes.post(
      path: '$url/$path/${profileEntity.userID}',
      body: _mapper.toMap(profileEntity),
    );
  }
}
