import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/library/dio_client.dart';
import 'package:app_receitas/src/core/services/api_response/api_response.dart';
import 'package:app_receitas/src/feactures/profile/domain/entities/profile_entity.dart';
import 'package:app_receitas/src/feactures/profile/domain/mappers/profile_mapper.dart';
import 'package:app_receitas/src/feactures/profile/domain/repositories/profile_repository.dart';
import 'package:dio/dio.dart';

import 'package:http_parser/http_parser.dart';

class ProfileRepositoryImp extends ProfileRepository {
  final DioClient dio;
  final ProfileMappper _mapper;
  final ApiResponse _apiResponse;

  ProfileRepositoryImp(this.dio, this._apiResponse, this._mapper);

  String url = Global.dnsApi;
  String path = 'profile';

  @override
  Future<ProfileEntity> getProfile(String userID) async {
    final response = await dio.get('$url/$path/$userID', headers: {
      'Authorization': Global.token,
    });

    final result = _apiResponse.handleResponse(response);

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

    _apiResponse.handleResponse(response);
  }

  @override
  Future<void> updateProfile(ProfileEntity profileEntity) async {
    final response = await dio.post('$url/$path/${profileEntity.userID}',
        body: _mapper.toMap(profileEntity),
        headers: {
          'Authorization': Global.token,
        });

    _apiResponse.handleResponse(response);
  }
}
