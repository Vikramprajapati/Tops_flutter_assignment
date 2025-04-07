import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LifeCycleApp extends StatefulWidget {
  const LifeCycleApp({super.key});

  @override
  State<LifeCycleApp> createState() => _LifeCycleAppState();
}

//add mixin of WidgetsBindingObserver to manage lifeCycle

class _LifeCycleAppState extends State<LifeCycleApp>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _showToast("App Started");

  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    _showToast("App Closed");
  }

  void _showToast(String s) {
    Fluttertoast.showToast(msg: s,
      fontSize: 12,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.detached:
        _showToast("App Detached");
        break;
      case AppLifecycleState.resumed:
        _showToast("App Resumed");
        break;
      case AppLifecycleState.inactive:
        _showToast("App inActive");
        break;
      case AppLifecycleState.hidden:
        _showToast("App Hidden");
        break;
      case AppLifecycleState.paused:
        _showToast("App Paused");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App LifeCycle'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Text('Home Screen',style: TextStyle(fontSize: 24),),
        ),
      ),
    );
  }
}


