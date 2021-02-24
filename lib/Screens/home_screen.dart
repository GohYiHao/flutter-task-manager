import 'package:flutter/material.dart';
import 'add_task_screen.dart';
import 'history_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _buildTask(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: <Widget>[
          Divider(),
          ListTile(
            title: Text("Demo Task Title"),
            subtitle: Text("Feb 28, 2021 - 12:00PM • High"),
            trailing: Checkbox(
              onChanged: (value) {
                print(value);
              },
              activeColor: Colors.redAccent,
              value: true,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(250, 250, 250, 1),
          // leading: IconButton(icon: Icon(Icons.apps, color: Colors.black,), onPressed: null),
          title: Row(
            children: [
              Text(
                "Task Manager",
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 20.0,
                  fontWeight: FontWeight.normal,
                  letterSpacing: -1.2,
                ),
              ),
              // Text(
              //   "Manager",
              //   style: const TextStyle(
              //     color: Colors.redAccent,
              //     fontSize: 20.0,
              //     fontWeight: FontWeight.normal,
              //     letterSpacing: 0,
              //   ),
              // )
            ],
          ),
          centerTitle: false,
          elevation: 0,
          actions: [
            Container(
              margin: const EdgeInsets.all(0),
              child: IconButton(
                  icon: Icon(Icons.history),
                  iconSize: 25.0,
                  color: Colors.redAccent,
                  onPressed: () => Navigator.push(
                      context, MaterialPageRoute(builder: (_) => History()))),
            ),
            Container(
              margin: const EdgeInsets.all(6.0),
              child: IconButton(
                  icon: Icon(Icons.add_circle_outline),
                  iconSize: 25.0,
                  color: Colors.redAccent,
                  onPressed: () => Navigator.push(
                      context, MaterialPageRoute(builder: (_) => AddTask()))),
            )
          ],
        ),
        body: ListView.builder(
            itemCount: 15,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                      padding: const EdgeInsets.all(10.0),
                      decoration: new BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Color.fromRGBO(240, 240, 240, 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Center(
                        child: Text(
                          'You have 16 pending task out of 35',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    )
                  ],
                );
              }
              return _buildTask(index);
            }));
  }
}
