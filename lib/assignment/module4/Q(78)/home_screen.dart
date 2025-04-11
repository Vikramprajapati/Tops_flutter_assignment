import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> nameList = [];

  final _nameController = TextEditingController();
  FocusNode focusNode = FocusNode();
  int editIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Screen'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                focusNode: focusNode,
                controller: _nameController,
                decoration: InputDecoration(
                    label: Text("Enter Name"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              SizedBox(
                height: 15,
              ),
              editIndex >= 0
                  ? ElevatedButton(
                      onPressed: () {
                        setState(() {
                          nameList[editIndex] = _nameController.text.toString();
                        });
                      },
                      child: Text("Update"))
                  : ElevatedButton(
                      onPressed: () {
                        focusNode.unfocus();
                        String name = _nameController.text.toString();
                        if (_nameController.text.toString() == "" ||
                            nameList
                                .contains(_nameController.text.toString())) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("name is already exits...")));
                          _nameController.clear();
                        } else {
                          setState(() {
                            nameList.add(name);
                            _nameController.clear();
                          });
                        }
                      },
                      child: Text("Add")),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: ListView.separated(
                itemCount: nameList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Name"),
                            content: Text(
                              nameList[index],
                              style: TextStyle(fontSize: 16),
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("OK"))
                            ],
                          ),
                        );
                      },
                      onLongPress: () {
                        focusNode.unfocus();
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Column(
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: Text("Alert"),
                                          content: Text(
                                              "Are you sure want to delete Item?"),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    nameList.removeAt(index);
                                                    Navigator.pop(context);
                                                  });
                                                },
                                                child: Text("OK")),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text("CANCEL")),
                                          ],
                                        ),
                                      );

                                      //   Navigator.pop(context);
                                    },
                                    child: Text("Delete")),
                                SizedBox(
                                  height: 10,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        editIndex=index;
                                        _nameController.text = nameList[index];
                                      });


                                      Navigator.pop(context);
                                    },
                                    child: Text("Edit")),
                                SizedBox(
                                  height: 10,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Exit"))
                              ],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 50,
                        color: Colors.grey.shade300,
                        child: Center(
                            child: Text(
                          nameList[index],
                          style: TextStyle(fontSize: 24),
                        )),
                      ));
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 15,
                  );
                },
              ))
            ],
          ),
        ));
  }
}
