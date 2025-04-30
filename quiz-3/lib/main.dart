import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz-3',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  double _progress = 0.0;
  bool _showReminder = false;
  int _milestoneIndex = 0;
  bool _goalReached = false;

  late AnimationController _balloonController;
  late Animation<double> _balloonSize;
  late Animation<double> _balloonOffset;

  final List<String> _messages = [
    "Keep it up!",
    "You're doing great!",
    "Halfway there!",
    "Almost done!",
    "Goal reached! 🎉"
  ];

  @override
  void initState() {
    super.initState();

    _balloonController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _balloonSize = Tween<double>(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(parent: _balloonController, curve: Curves.easeOut),
    );

    _balloonOffset = Tween<double>(begin: 0.0, end: -150.0).animate(
      CurvedAnimation(parent: _balloonController, curve: Curves.easeIn),
    );
  }

  void _addWater() {
    setState(() {
      _progress += 0.2;
      _showReminder = !_showReminder;

      if (_progress >= 1.0) {
        _goalReached = true;
        _balloonController.forward();
      } else {
        _milestoneIndex = (_milestoneIndex + 1) % _messages.length;
      }
    });
  }

  @override
  void dispose() {
    _balloonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final messageStyle = TextStyle(
      fontSize: 20 + (_milestoneIndex * 2),
      color: Colors.blueAccent.shade100.withOpacity(0.8 + 0.2 * (_progress)),
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      appBar: AppBar(title: Text("Hydration Tracker")),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  width: double.infinity,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.blue.shade50,
                  ),
                  alignment: Alignment.centerLeft,
                  child: FractionallySizedBox(
                    widthFactor: _progress,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                AnimatedCrossFade(
                  duration: Duration(milliseconds: 500),
                  firstChild: Text(
                      _messages[_milestoneIndex % _messages.length],
                      style: messageStyle),
                  secondChild: Text(
                      _messages[(_milestoneIndex + 1) % _messages.length],
                      style: messageStyle),
                  crossFadeState: _progress % 0.4 < 0.2
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                ),
                SizedBox(height: 20),
                AnimatedOpacity(
                  duration: Duration(milliseconds: 800),
                  opacity: _showReminder ? 1.0 : 0.0,
                  child: Text("💧 Time to drink some water!",
                      style: TextStyle(fontSize: 16)),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: _addWater,
                  child: Text("Add Water"),
                ),
              ],
            ),
          ),
          if (_goalReached)
            AnimatedBuilder(
              animation: _balloonController,
              builder: (_, child) => Positioned(
                bottom: 100 + _balloonOffset.value,
                left: MediaQuery.of(context).size.width / 2 - 50,
                child: SizedBox(
                  width: _balloonSize.value,
                  height: _balloonSize.value,
                  child: child,
                ),
              ),
              child: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQt215Ev6oU2T9a_3JXUHLqlbjF8fjsY9gP1w&s",
                fit: BoxFit.contain,
              ),
            ),
        ],
      ),
    );
  }
}
