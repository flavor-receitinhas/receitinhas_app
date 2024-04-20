import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/library/dio_client.dart';
import 'package:app_receitas/src/core/services/api_response/api_response.dart';
import 'package:app_receitas/src/feactures/favorite/domain/dtos/favorite_dto.dart';
import 'package:app_receitas/src/feactures/favorite/domain/entities/favorite_entity.dart';
import 'package:app_receitas/src/feactures/favorite/domain/mappers/favorite_mapper.dart';
import 'package:app_receitas/src/feactures/favorite/domain/repositories/favorite_repository.dart';

class FavoriteRepositoryImp extends FavoriteRepository {
  final DioClient _dioClient;
  final ApiResponse _apiResponse;
  final FavoriteMapper _mapper;

  FavoriteRepositoryImp(this._dioClient, this._apiResponse, this._mapper);

  String url = Global.dnsApi;
  String path = 'favorite';

  @override
  Future<void> addFavorite(FavoriteDto favoriteDto) async {
    final response = await _dioClient.post(
      '$url/$path/${favoriteDto.userId}',
      body: _mapper.toJsonDto(favoriteDto),
      headers: {
        'Authorization': Global.token,
      },
    );
    _apiResponse.handleResponse(response);
  }

  @override
  Future<List<FavoriteEntity>> getFavorites() async {
    final response = await _dioClient.get(
      '$url/$path/${Global.user!.id}',
      headers: {
        'Authorization': Global.token,
      },
    );
    final result = _apiResponse.handleResponse(response);

    return (result as List).map((e) => _mapper.fromJson(e)).toList();
  }

  @override
  Future<void> removeFavorite(String userId, String recipeId) async {
    final response = await _dioClient.delete(
      '$url/$path/$userId/$recipeId',
      headers: {
        'Authorization': Global.token,
      },
    );
    _apiResponse.handleResponse(response);
  }
}
