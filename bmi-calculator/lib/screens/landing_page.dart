import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/fade_route.dart';
import 'bmiinput_page.dart';
import 'bodyfat_page.dart';
import 'package:flutter/animation.dart';
import 'dart:math';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with TickerProviderStateMixin {
  void addBubbles({animation, topPos = 0, leftPos = 0, bubbles = 15}) {
    for (var i = 0; i < bubbles; i++) {
      var range = Random(); // To use random import math.dart
      var minSize = range.nextInt(30).toDouble();
      var maxSize = range.nextInt(30).toDouble();
      var left = leftPos == 0
          ? range.nextInt(MediaQuery.of(context).size.width.toInt()).toDouble()
          : leftPos;
      var top = topPos == 0
          ? range.nextInt(MediaQuery.of(context).size.height.toInt()).toDouble()
          : topPos;

      var bubble = new Positioned(
          left: left,
          top: top,
          child: AnimatedBubble(
              animation: animation, startSize: minSize, endSize: maxSize));

      setState(() {
        areBubblesAdded = true;
        bubbleWidgets.add(bubble);
      });
    }
  }

  final bubbleWidgets = List<Widget>();
  bool areBubblesAdded = false;
  Animation<double> bubbleAnimation;
  Animation<double> backgroundAnimation;
  AnimationController bubbleController;

  AlignmentTween alignmentTop =
      AlignmentTween(begin: Alignment.topRight, end: Alignment.topLeft);
  AlignmentTween alignmentBottom =
      AlignmentTween(begin: Alignment.bottomRight, end: Alignment.bottomLeft);

  //Dark color
  Animatable<Color> backgroundDark = TweenSequence<Color>([
    TweenSequenceItem(
      weight: 0.5,
      tween: ColorTween(
        begin: Color(0xff1565c0),
        end: Color(0xff0277bd),
      ),
    ),
    TweenSequenceItem(
      weight: 0.5,
      tween: ColorTween(
        begin: Color(0xff0277bd),
        end: Color(0xff1565c0),
      ),
    ),
  ]);
// Normal color
  Animatable<Color> backgroundNormal = TweenSequence<Color>([
    TweenSequenceItem(
      weight: 0.5,
      tween: ColorTween(
        begin: Color(0xff1e88e5),
        end: Color(0xff039be5),
      ),
    ),
    TweenSequenceItem(
      weight: 0.5,
      tween: ColorTween(
        begin: Color(0xff039be5),
        end: Color(0xff1e88e5),
      ),
    ),
  ]);
// Light color
  Animatable<Color> backgroundLight = TweenSequence<Color>([
    TweenSequenceItem(
      weight: 0.5,
      tween: ColorTween(
        begin: Color(0xff42a5f5),
        end: Color(0xff4fc3f7),
      ),
    ),
    TweenSequenceItem(
      weight: 0.5,
      tween: ColorTween(
        begin: Color(0xff4fc3f7),
        end: Color(0xff42a5f5),
      ),
    ),
  ]);

  AnimationController _backgroundController;
  @override
  void initState() {
    //init fn
    super.initState();
    _backgroundController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
    backgroundAnimation =
        CurvedAnimation(parent: _backgroundController, curve: Curves.easeIn);
    bubbleController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    bubbleAnimation = CurvedAnimation(
        parent: bubbleController, curve: Curves.easeIn)
      ..addListener(() {})
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            addBubbles(animation: bubbleAnimation, topPos: -1.001, bubbles: 2);
            bubbleController.reverse();
          });
        }
        if (status == AnimationStatus.dismissed) {
          setState(() {
            addBubbles(animation: bubbleAnimation, topPos: -1.001, bubbles: 2);
            bubbleController.forward();
          });
        }
      });
//Add the below to start animating bubbles to move.
    bubbleController.forward();
  }

  @override
  Widget build(BuildContext context) {
    if (!areBubblesAdded) {
      addBubbles(animation: bubbleAnimation);
    }
    return AnimatedBuilder(
        animation: backgroundAnimation,
        builder: (context, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Body Fat & BMI Calculator',
                style: kAppBarStyle,
              ),
              centerTitle: true,
            ),
            body: Stack(
              children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: alignmentTop.evaluate(backgroundAnimation),
                          end: alignmentBottom.evaluate(backgroundAnimation),
                          colors: [
                            backgroundDark.evaluate(backgroundAnimation),
                            backgroundNormal.evaluate(backgroundAnimation),
                            backgroundLight.evaluate(backgroundAnimation),
                          ],
                        ),
                      ),
                    ),
                  ] +
                  bubbleWidgets +
                  [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                          child: Card(
                            margin: EdgeInsets.all(40),
                            elevation: 20,
                            color: kActiveCardColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context, FadeRoute(page: InputPage()));
                                  },
                                  child: Text(
                                    'Calculate Bmi:',
                                    textAlign: TextAlign.center,
                                    style: kLandingPageStyle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          color: Color(0xdcc2185b),
                          thickness: 2.1,
                          indent: 20,
                          endIndent: 20,
                          height: 5,
                        ),
                        Expanded(
                          child: Card(
                            color: kActiveCardColor,
                            elevation: 20,
                            margin: EdgeInsets.all(40),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context, FadeRoute(page: BodyFat()));
                                  },
                                  child: Text(
                                    'Calculate Body Fat Percentage:',
                                    textAlign: TextAlign.center,
                                    style: kLandingPageStyle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
            ),
          );
        });
  }
}

class AnimatedBubble extends AnimatedWidget {
  var transform = Matrix4.identity();
  double startSize;
  double endSize;
  AnimatedBubble(
      {Key key, Animation<double> animation, this.startSize, this.endSize})
      : super(key: key, listenable: animation);
  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    final _sizeTween = Tween<double>(begin: startSize, end: endSize);

    transform.translate(0.0, 0.5, 0.0);

    return Opacity(
      opacity: 0.4,
      child: Transform(
        transform: transform,
        child: Container(
          decoration:
              BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          height:
              _sizeTween.evaluate(animation), //_sizeTween.evaluate(animation),
          width:
              _sizeTween.evaluate(animation), //_sizeTween.evaluate(animation),
        ),
      ),
    );
  }
}
