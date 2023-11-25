import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Dashboard extends StatefulWidget {
  String? name,email;
   Dashboard({
    Key? key,
    required this.name,
    required this.email,

  }) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
        title: const Text("Dashboard"),
        centerTitle: true,

       ),
       body:Center(
         child: Column(
           children: [
              Text('login name is- > ${widget.name}'),
             const SizedBox(height: 20,),
              Text('login email is- > ${widget.email}'),
         
         
           ],
         ),
       ),
    );
  }
}