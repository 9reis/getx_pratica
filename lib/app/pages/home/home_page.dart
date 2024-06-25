import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:getx_pratica/app/data/repositories/github_repository.dart';
import 'package:getx_pratica/app/pages/home/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeController _controller;

  @override
  void initState() {
    super.initState();
    _controller = HomeController(
      repo: GithubRepository(
        dio: Dio(),
      ),
    );

    _controller.getGithubUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Github Users'),
        centerTitle: true,
      ),
      // Atualiza a tela quando um obs alterou o estado
      body: Obx(() {
        return _controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : _controller.users.isEmpty
                ? const Center(
                    child: Text('Nenhum usuário foi encontrado '),
                  )
                : ListView.separated(
                    separatorBuilder: (_, __) => const Divider(),
                    itemCount: _controller.users.length,
                    itemBuilder: (_, i) {
                      final user = _controller.users[i];
                      return ListTile(
                        leading: CircleAvatar(
                          radius: 50,
                          backgroundColor: Theme.of(context).primaryColor,
                          child: Padding(
                            padding: EdgeInsets.all(2),
                            child: CircleAvatar(
                              radius: 45,
                              backgroundImage: NetworkImage(user.avatarUrl),
                            ),
                          ),
                        ),
                        title: const Text(
                          'Usuário',
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                        subtitle: Text(
                          user.login,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  );
      }),
    );
  }
}
