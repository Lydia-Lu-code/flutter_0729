import 'package:flutter/material.dart';

void main() {
  runApp(HauntedHouseApp());
}

class HauntedHouseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HauntedHouseScreen(),
    );
  }
}

class HauntedHouseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> hauntedEvents = [
      "murder",
      "ghost sighting",
      "murder",
      "exorcism",
      "mysterious disappearance"
    ];
    int hauntedScore = calculateHauntedScore(hauntedEvents);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Haunted House Score",
          style: TextStyle(color: Color.fromARGB(255, 228, 201, 51)), // 設置 AppBar 標題文字顏色
        ),
        backgroundColor: Color.fromARGB(255, 110, 110, 110),  // 設置 AppBar 背景顏色
      ),
      body: Center(
        child: Text(
          "房子的恐怖指數: $hauntedScore",
          style: TextStyle(color: Colors.white),  // 設置文字顏色以便在深色背景下可見
        ),
      ),
      backgroundColor: Colors.grey[900],  // 設置 Scaffold 背景顏色
    );
  }

  int calculateHauntedScore(List<String> events) {
    Map<String, int> counts = {};

    // 計算每個事件出現的次數
    for (String event in events) {
      counts[event] = (counts[event] ?? 0) + 1;
    }

    int totalScore = 0;

    // 根據規則計算總分
    counts.forEach((event, count) {
      switch (event) {
        case "murder":
          totalScore += count * 10;
          break;
        case "ghost sighting":
          totalScore += count * 5;
          break;
        case "mysterious disappearance":
          totalScore += count * 7;
          break;
        default:
          break;
      }
    });

    // 如果有 "exorcism" 事件，將總分減半
    if (counts.containsKey("exorcism")) {
      totalScore ~/= 2;
    }

    return totalScore;
  }
}
