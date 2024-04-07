import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class TickerStopwatch extends StatefulWidget {
  const TickerStopwatch({super.key});

  @override
  State<TickerStopwatch> createState() => _TickerStopwatchState();
}

class _TickerStopwatchState extends State<TickerStopwatch>
    with SingleTickerProviderStateMixin {
  bool _isStopwatchRunning = false;
  DateTime? _startTime;
  int _baseTime = 0;
  int _runningTime = 0;
  List<String> _lapTimes = [];
  late final Ticker _ticker;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker((elapsed) {
      setState(() {
        if (_startTime != null) {
          _runningTime =
              DateTime.now().difference(_startTime!).inMilliseconds + _baseTime;
        }
      });
    });
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  void _startOrPause() {
    if (_isStopwatchRunning) {
      // 일시정지
      setState(() {
        _baseTime = _runningTime;
        _isStopwatchRunning = false;
      });
      _startTime = null;
      _ticker.stop();
    } else {
      setState(() {
        _startTime = DateTime.now();
        _isStopwatchRunning = true;
      });
      _ticker.start();
    }
  }

  void _reset() {
    _ticker.stop();
    setState(() {
      _isStopwatchRunning = false;
      _runningTime = 0;
      _baseTime = 0;
      _lapTimes.clear();
    });
  }

  void _record() {
    setState(() {
      _lapTimes.add(
          'Rank #${_lapTimes.length + 1}         ${_runningTime ~/ 1000}.${(_runningTime % 1000).toString().padLeft(3, '0')}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          '${_runningTime ~/ 1000}.${(_runningTime % 1000).toString().padLeft(3, '0')}',
          style: TextStyle(fontSize: 30),
        ),
        SizedBox(height: 30,),
        Expanded(
          child: ListView.builder(
              itemCount: _lapTimes.length,
              itemBuilder: (context, index) {
                return Center(child: Text(_lapTimes[index], style: TextStyle(fontSize: 20),));
              }),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.orange,
              onPressed: () {
                _reset();
              },
              child: Icon(Icons.refresh),
            ),
            FloatingActionButton(
              backgroundColor: Colors.blue,
              onPressed: () {
                _startOrPause();
              },
              child: _isStopwatchRunning
                  ? Icon(Icons.pause)
                  : Icon(Icons.play_arrow),
            ),
            FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: () {
                _record();
              },
              child: Icon(Icons.add),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
