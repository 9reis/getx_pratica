import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'package:getx_pratica/app/controller/detalhes_controller.dart';
import 'package:getx_pratica/app/data/repositories/github_repository.dart';

class DetalhesPage extends StatefulWidget {
  final String username;

  const DetalhesPage({
    Key? key,
    required this.username,
  }) : super(key: key);

  @override
  State<DetalhesPage> createState() => _DetalhesPageState();
}

class _DetalhesPageState extends State<DetalhesPage> {
  late final DetalhesController _controller;

  @override
  void initState() {
    super.initState();
    _controller = DetalhesController(
      repository: GithubRepository(
        dio: Dio(),
      ),
    );
    _controller.getGithubUser(username: widget.username);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes'),
      ),
      body: Obx(() {
        return _controller.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : _controller.githurUser == null
                ? Center(
                    child: Text('Nenhum usuário encontrado'),
                  )
                : _buildUserInfo();
      }),
    );
  }

  Widget _buildUserInfo() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                _controller.githurUser!.avatarUrl,
                height: 275,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 32,
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                Icons.emoji_people_rounded,
                color: Theme.of(context).primaryColor,
              ),
              title: const Text(
                'Nome',
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                _controller.githurUser!.name ?? "Sem informações",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                Icons.short_text_rounded,
                color: Theme.of(context).primaryColor,
              ),
              title: const Text(
                'Login',
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                _controller.githurUser!.login,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                Icons.grain_outlined,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(
                'Repositórios publicos',
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                _controller.githurUser!.publicRepos.toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                Icons.people_rounded,
                color: Theme.of(context).primaryColor,
              ),
              title: const Text(
                'Seguidores',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                _controller.githurUser!.followers.toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                Icons.flag_rounded,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(
                'Local',
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                _controller.githurUser!.location ?? "Sem informações",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
