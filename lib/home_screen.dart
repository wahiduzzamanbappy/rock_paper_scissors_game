import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'game_controllers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GameChoice _gameController = Get.put(GameChoice());
  bool _showResult = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rock Paper Scissors'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
                  'Your Choice: ${_gameController.userChoice.value}',
                  style: const TextStyle(fontSize: 18),
                )),
            const SizedBox(height: 10),
            Obx(() => Text(
                  'Computer Choice: ${_gameController.computerChoice.value}',
                  style: const TextStyle(fontSize: 18),
                )),
            const SizedBox(height: 10),

            Obx(() {
              _showResult = _gameController.result.value.isNotEmpty;
              return AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: _showResult ? 1.0 : 0.0,
                child: Text(
                  _gameController.result.value,
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
              );
            }),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _gameController.choices
                  .map((choice) => ElevatedButton(
                        onPressed: () {
                          _gameController.playGame(choice);
                          setState(() {});
                        },
                        child: Text(choice),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
