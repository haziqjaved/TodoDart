import 'package:flutter/material.dart';

class Todoapp extends StatefulWidget {
  const Todoapp({Key? key}) : super(key: key);

  @override
  _TodoappState createState() => _TodoappState();
}

class _TodoappState extends State<Todoapp> {
  var input;
  List<dynamic> list = [
    'File Prepartion',
    'Meeting with boss',
    'Eggs',
    'Bread',
    'potatos: 1KG '
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                margin: EdgeInsets.only(top: 18),
                child: ListTile(
                  title: Text(
                    "${list[index]}",
                    style: TextStyle(color: Colors.blue),
                  ),
                  trailing: Container(
                    width: 50,
                    child: Row(
                      children: [
                        GestureDetector(
                          child: Icon(Icons.edit),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Edit Your task"),
                                    content: TextField(
                                      onChanged: (value) {
                                        input = value;
                                      },
                                    ),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              list.replaceRange(
                                                  index, index + 1, {input});
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("Edit"))
                                    ],
                                  );
                                });
                          },
                        ),
                        GestureDetector(
                          child: Icon(Icons.clear),
                          onTap: () {
                            setState(() {
                              list.removeAt(index);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ));
          }),
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: Container(
          width: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                child: Icon(Icons.delete_forever),
                onPressed: () {
                  setState(() {
                    list.clear();
                  });
                },
              ),
              FloatingActionButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Add Item"),
                            content: TextField(
                              onChanged: (value) {
                                input = value;
                              },
                            ),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      list.add(input);
                                    });
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Add"))
                            ],
                          );
                        });
                  },
                  child: Icon(Icons.add_task)),
            ],
          ),
        ),
      ),
    );
  }
}
