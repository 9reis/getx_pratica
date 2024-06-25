import 'package:dio/dio.dart';
import 'package:getx_pratica/app/data/model/user.dart';

class GithubRepository {
  final Dio dio;

  GithubRepository({required this.dio});

  // Pega a lista de users do Git
  Future<List<User>> getGithubUsers() async {
    final result = await dio.get('https://api.github.com/users');

    final List<User> users = [];

    if (result.statusCode == 200) {
      // result.data.map((item) => users.add(User.fromMap(item))).toList();
    }
    return users;
  }

  Future<User> getGithubUser({required String user}) async {
    final result = await dio.get('https://api.github.com/users$user');

    late User githubUser;

    if (result.statusCode == 200) {
      githubUser = User.fromMap(result.data);
    }
    return githubUser;
  }
}
