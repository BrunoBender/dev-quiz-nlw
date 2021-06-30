// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devquiz_nlw/secondApp/secondApp_controller.dart';
import 'package:devquiz_nlw/secondApp/secondApp_state.dart';
import 'package:flutter/material.dart';

class SecondAppPage extends StatefulWidget {
  const SecondAppPage({Key? key}) : super(key: key);

  @override
  _SecondAppPageState createState() => _SecondAppPageState();
}

class _SecondAppPageState extends State<SecondAppPage> {
  final controller = SecondAppController();
  String text = "Entrei!";

  @override
  void initState(){
    super.initState();
    controller.stateNotifier.addListener(() {
      setState(() {
        text = "Saí";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Seja bem vindo!"),),
      // ignore: file_names
      // body: Center(
      //   child: StreamBuilder(
      //     stream: Firestore,
      //   )
      //   ,
      // ),
    floatingActionButton: IconButton(onPressed: (){controller.state = PressButtonState.pressed;}, icon: Icon(Icons.account_circle_rounded, size: 40,),),
    );
  }
}
