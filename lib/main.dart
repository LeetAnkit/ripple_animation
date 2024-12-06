import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.cyan,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {




  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late Animation _animation;
  late AnimationController _animationController;

  var listRadius =[ 150.0, 200.0, 250.0 , 300.0 , 350.0];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController= AnimationController(vsync:this , duration: Duration(seconds: 4));
    _animation =Tween(begin: 0.0 , end: 1.0).animate(_animationController);

    _animationController.addListener(() {
      setState(() {

      });

    });

    _animationController.forward();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          // TRY THIS: Try changing the color here to a specific color (to
          // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          // change color while the other colors stay the same.
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('Ripple Effect'),
        ),

        body:
        Center(
          child: Stack(
            alignment: Alignment.center,

            children:[
              buildMyContainer(listRadius[0]),
              buildMyContainer(listRadius[1]),
              buildMyContainer(listRadius[2]),
              buildMyContainer(listRadius[3]),
              buildMyContainer(listRadius[4]),
              Icon(Icons.add_call, color: Colors.white , size: 34)
              ]


              //     Container(
              //   width: radius * _animation.value,
              //   height: radius * _animation.value,
              //   decoration: BoxDecoration(
              //     shape: BoxShape.circle,
              //     color: Colors.blue.withOpacity(1.0 - _animation.value)
              //   ),
              // )


            
          ),
        )

    );



    // This trailing comma makes auto-formatting nicer for build methods.

  }
  Widget buildMyContainer(radius){
    return  Container(
     width: radius * _animation.value,
     height: radius * _animation.value,
     decoration: BoxDecoration(
       shape: BoxShape.circle,
       color: Colors.green.withOpacity(1.0 - _animation.value)
     ),
   );
  }
}

