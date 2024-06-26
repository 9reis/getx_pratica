import 'package:get/get.dart';
import 'package:getx_pratica/app/data/model/user.dart';
import 'package:getx_pratica/app/data/repositories/github_repository.dart';

class DetalhesController extends GetxController {
  final GithubRepository repository;

  DetalhesController({required this.repository});

  User? _githubuser;
  User? get githurUser => _githubuser;

  final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;

  getGithubUser({required String username}) async {
    _isLoading.value = true;

    final result = await repository.getGithubUser(user: username);
    _githubuser = result;

    _isLoading.value = false;
  }
}
