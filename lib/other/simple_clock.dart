import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SimpleClock extends StatefulWidget {
  final Duration interval;
  final TextStyle? style;

  const SimpleClock({
    super.key,
    this.style,
    this.interval = const Duration(seconds: 1),
  });

  @override
  State<SimpleClock> createState() => _SimpleClockState();
}

class _SimpleClockState extends State<SimpleClock> {
  late Timer _timer;
  late DateTime _now;

  @override
  void initState() {
    super.initState();
    _now = DateTime.now();
    _timer = Timer.periodic(widget.interval, (_) {
      setState(() {
        _now = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String formattedTime = DateFormat.Hms().format(_now);
    return Text(formattedTime, style: widget.style);
  }
}
