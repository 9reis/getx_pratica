import 'package:get/get.dart';
import 'package:getx_pratica/app/data/model/user.dart';
import 'package:getx_pratica/app/data/repositories/github_repository.dart';

class DetalhesController extends GetxController {
  final GithubRepository repository;

  DetalhesController({required this.repository});

  User? _githubuser;
  User? get githurUser => _githubuser;

  getGithubUser({required String username}) async {
    final result = await repository.getGithubUser(user: username);
    _githubuser = result;
  }
}
