import 'package:get/get.dart';
import 'package:getx_pratica/app/data/model/user.dart';
import 'package:getx_pratica/app/data/repositories/github_repository.dart';

class HomeController extends GetxController {
  HomeController({required this.repo});

  final GithubRepository repo;

  final List<User> _users = <User>[].obs;
  List<User> get users => _users;

  final RxBool _isloading = false.obs;
  RxBool get isLoading => _isloading;

  final RxInt i = 0.obs;

  void increment() {
    i.value++;
  }

  getGithubUsers() async {
    // Atribui um valor ao observável
    _isloading.value = true;
    final res = await repo.getGithubUsers();

    _users.addAll(res);

    _isloading.value = false;
  }
}
