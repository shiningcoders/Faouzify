import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  Animation cardAnimation, delayedCardAnimation, fabButtonanim, infoAnimation;
  AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    cardAnimation = Tween(begin: 0.0, end: -0.025).animate(
        CurvedAnimation(curve: Curves.fastOutSlowIn, parent: controller));

    delayedCardAnimation = Tween(begin: 0.0, end: -0.05).animate(
        CurvedAnimation(
            curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
            parent: controller));

    fabButtonanim = Tween(begin: 1.0, end: -0.0008).animate(CurvedAnimation(
        curve: Interval(0.8, 1.0, curve: Curves.fastOutSlowIn),
        parent: controller));

    infoAnimation = Tween(begin: 0.0, end: 0.025).animate(CurvedAnimation(
        curve: Interval(0.7, 1.0, curve: Curves.fastOutSlowIn),
        parent: controller));
  }

  @override
  Widget build(BuildContext context) {
    final devHeight = MediaQuery.of(context).size.height;
    controller.forward();
    return new AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget child) {
          return Scaffold(
            appBar: new AppBar(
              backgroundColor: Colors.black,             
              title: new Text('faouzia',
                  style: TextStyle(

                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              actions: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite, color: Colors.greenAccent),
                  ),
                ),
                SizedBox(width: 10.0,),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.settings, color: Colors.white),
                )
              ],
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
                    child: Stack(
                      overflow: Overflow.visible,
                      children: <Widget>[
                        Positioned(
                          left: 20.0,
                          child: Container(
                            transform: Matrix4.translationValues(0.0, delayedCardAnimation.value * devHeight, 0.0),
                            width: 260.0,
                            height: 400.0,
                            decoration: BoxDecoration(
                                color: Colors.amberAccent,
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                        ),
                        Positioned(
                          
                          left: 10.0,
                          child: Container(
                            transform: Matrix4.translationValues(0.0, cardAnimation.value * devHeight, 0.0),
                            width: 280.0,
                            height: 400.0,
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                        ),
                        Container(
                          width: 300.0,
                          height: 400.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                  image: AssetImage('assets/a.jpg'),
                                  fit: BoxFit.cover)),
                        ),
                        Positioned(
                          top: 320.0,
                          left: 15.0,
                          child: Container(
                            transform: Matrix4.translationValues(0.0, infoAnimation.value * devHeight, 0.0),
                            width: 270.0,
                            height: 90.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 1.0,
                                      color: Colors.black12,
                                      spreadRadius: 2.0)
                                ]),
                            child: Container(
                              padding: EdgeInsets.all(7.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        "You don't even know me",
                                        style: TextStyle(
                                            
                                            fontSize: 15.0),
                                      ),
                                      SizedBox(width: 0.5),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.arrow_drop_down),
                                        color: Colors.black,
                                      ),
                                      SizedBox(width: 10.0),
                                      Text(
                                        '3.7 M',
                                        style: TextStyle(
                                            
                                            fontSize: 10.0,
                                            color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5.0),
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        'Trending on Spotify',
                                        style: TextStyle(
                                            
                                            fontSize: 10.0,
                                            color: Colors.green),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
                Container(
                  transform: Matrix4.translationValues(0.0, fabButtonanim.value * devHeight, 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      FloatingActionButton(
                        elevation: 0.0,
                        onPressed: () {},
                        child: Icon(Icons.queue_music, color: Colors.blueAccent),
                        backgroundColor: Colors.black,
                      ),
                      FloatingActionButton(
                        onPressed: () {},
                        child: Icon(Icons.play_arrow, color: Colors.greenAccent),
                        backgroundColor: Colors.black,
                      ),
                      FloatingActionButton(
                        onPressed: () {},
                        child: Icon(Icons.favorite, color: Colors.pink),
                        backgroundColor: Colors.black,
                      )
                    ],
                  ),
                )
              ],
            ),
            drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: <Widget>[
                  IconButton(
                    padding: EdgeInsets.only(left: 15.0),
                    onPressed: () {},
                    icon: Icon(Icons.rounded_corner, color: Colors.white),
                  ),
                  Center(child: Text('faouzia', style: TextStyle(color: Colors.white, fontSize: 40.0),)),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.black,
              ),
            ),
            ListTile(
              title: Center(child: Text('Latest Songs', style: TextStyle(color: Colors.black, fontSize: 25.0),)),
              onTap: () {},

            ),
            ListTile(
              title: Center(child: Text('Albumbs', style: TextStyle(color: Colors.black, fontSize: 25.0),),),
              onTap: () {},
            ),
            ListTile(
              title: Center(child: Text('Tours', style: TextStyle(color: Colors.black, fontSize: 25.0),),),
              onTap: () {},
            ),
            ListTile(
              title: Center(child: Text('Follow', style: TextStyle(color: Colors.black, fontSize: 25.0),),),
              onTap: () {},
            ),
            ListTile(
              title: Center(child: Text('About', style: TextStyle(color: Colors.black, fontSize: 25.0),),),
              onTap: () {},
            ),
            SizedBox(height: 150.0,),
            Center(child: Text('Made with Hands by #ajayistic', style: TextStyle(fontSize: 12.0, fontStyle: FontStyle.italic),)),
          ],
        ),
      ),

          );
        });
  }
}