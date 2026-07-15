import 'package:flutter/material.dart';

const en = ['mid','inc','ty','np','nt','wp','gg','r?','nc','lol'];
const ja = ['中央スペース','敵が自陣に潜入','ありがとう','問題ない','ナイストライ','上手だね','いい試合だった','始めるよ？','いいね','笑'];

String egg(int level) => level >= 4 ? '🦅' : level >= 3 ? '🐔' : level >= 2 ? '🐥' : level >= 1 ? '🐣' : '🥚';

void main() {
  final step = ValueNotifier(0);

  runApp(MaterialApp(home: ValueListenableBuilder(
    valueListenable: step,
    builder: (context, count, _) {
      final q = count.isEven;
      final i = (count ~/ 2) % en.length;
      final level = (count ~/ 2) ~/ en.length;

      return Scaffold(
        appBar: AppBar(title: Text('${egg(level)}minecraft略語大全  ${level + 1}巡目')),
        backgroundColor: q ? Colors.white : Colors.grey[100],
        body: InkWell(
          onTap: () => step.value++, // count++
          child: Center(
            child: Text(q ? 'Q: ${ja[i]}' : 'A: ${en[i]}', style: TextStyle(fontSize: 64)),
          ),
        ),
      );
    },
  )));
}