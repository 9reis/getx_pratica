import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pratica/app/data/repositories/github_repository.dart';
import 'package:getx_pratica/app/pages/home/home_controller.dart';

class TestePage extends StatefulWidget {
  const TestePage({super.key});

  @override
  State<TestePage> createState() => _TestePageState();
}

class _TestePageState extends State<TestePage> {
  late final HomeController _controller;
  @override
  void initState() {
    super.initState();
    _controller = HomeController(
      repo: GithubRepository(
        dio: Dio(),
      ),
    );

    _controller.i;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SafeArea(
        child: Scaffold(
          body: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: _controller.increment,
                  icon: const Icon(
                    Icons.abc,
                    size: 50,
                  ),
                  style: IconButton.styleFrom(),
                ),
                Text('${_controller.i.value}'),
              ],
            ),
          ),
        ),
      );
    });
  }
}
