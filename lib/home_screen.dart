import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:ten/background_%20painter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2),);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: CustomPaint(
              painter: BackgroundPainter(
                animation: _controller.view,
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RaisedButton(
                  onPressed: (){
                  _controller.forward();
                },
                  splashColor: Colors.orange,
                  child: Text('Animate'),

                ),
                RaisedButton(
                  onPressed: (){
                  _controller.reverse();
                },
                  child: Text('Come Back'),

                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
