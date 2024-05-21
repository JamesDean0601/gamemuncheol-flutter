import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/common/model/result.dart';
import 'package:gamemuncheol/feature/user/model/user.dart';
import 'package:gamemuncheol/common/model/base_error.dart';
import 'package:gamemuncheol/common/model/common_response.dart';
import 'package:gamemuncheol/feature/user/repository/user_api.dart';

part 'user_repository.g.dart';

@riverpod
UserRepository userRepository(UserRepositoryRef ref) {
  final UserApi userApi = ref.read(userApiProvider);
  return UserRepositoryImpl(userApi: userApi);
}

abstract class UserRepository {
  Future<Result<CommonResponse>> changeNickname(String nickname);
  Future<CommonResponse<bool>> isAgree();
  Future<CommonResponse<User>> agree();
  Future<CommonResponse<User>> me();
}

class UserRepositoryImpl implements UserRepository {
  final UserApi _userApi;

  UserRepositoryImpl({required UserApi userApi}) : _userApi = userApi;

  @override
  Future<Result<CommonResponse>> changeNickname(String nickname) async {
    try {
      final CommonResponse resp = await _userApi.changeNickname(nickname);
      if (resp.success) {
        return Success(resp);
      }
    } catch (e) {}

    return Failure(
      UnKnown(),
    );
  }

  @override
  Future<CommonResponse<bool>> isAgree() async {
    final CommonResponse<bool> isAgree = await _userApi.isAgree();
    return isAgree;
  }

  @override
  Future<CommonResponse<User>> agree() async {
    final CommonResponse<User> user = await _userApi.agree();
    return user;
  }

  @override
  Future<CommonResponse<User>> me() async {
    final CommonResponse<User> user = await _userApi.me();
    return user;
  }
}
