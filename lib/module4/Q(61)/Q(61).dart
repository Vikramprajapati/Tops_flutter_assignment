import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> category = ["Kinza", "Maman", "Tanuki", "Gastro"];

  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Menu'),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.filter_alt_outlined)),
            ],
            toolbarHeight: 80,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: ListView.separated(itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selected=index;
                            });
                          },
                          child: Container(
                            width:90 ,
                            padding: EdgeInsets.symmetric(horizontal: 16,vertical: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: selected==index?Colors.yellow:Colors.grey.shade200
                            ),
                            child: Text(category[index],style: TextStyle(color: selected==index?Colors.black:Colors.grey),),
                          ),
                        );
                      },
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 10,),
                          itemCount: category.length)
                  ),

              ],
            ),
          )),
    );
  }
}
