
import 'package:flutter/material.dart';
  
void main() {
  runApp(const MyApp());
}
  
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(title: 'Time picker'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  
  final String title;
  
  @override
  _HomePageState createState() => _HomePageState();
}
  
class _HomePageState extends State<HomePage> {

  TimeOfDay _timeOfDay = TimeOfDay.now();
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
            _timeOfDay.hour.toString().padLeft(2,'0') + ':' + _timeOfDay.minute.toString().padLeft(2,'0'), 
            style: const TextStyle(fontSize: 20)
           ),
           const SizedBox(height: 30,),
           MaterialButton(
            height: 50,
            minWidth: 150,
            color: Colors.blue,
            shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
            child: const Text('Open Time Picker',style: TextStyle(color: Colors.white),),
            onPressed: () {
             selectTime();
            }
           )
          ],
        ), 
      ), 
    ); 
  }

  Future < void > selectTime() async {
    TimeOfDay ? _picked = await showTimePicker(
      context: context,
      initialTime: _timeOfDay
    );
    if(_picked != null){
      setState(() {
        _timeOfDay = _picked;
      });
    }
  }
}