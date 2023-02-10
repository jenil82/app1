import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.indigo.shade200,
          title: Text(
            "Student Detail",
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: Stack(
          children: [
            ListView.builder(
              itemCount: Global.alldata.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 40,
                    child: Text(
                      "${Global.alldata[index].sid}",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  title: Text(
                    "${Global.alldata[index].sname}",
                    style: TextStyle(fontSize: 20),
                  ),
                  subtitle: Text(
                    "${Global.alldata[index].sstd}",
                    style: TextStyle(fontSize: 15),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      size: 25,
                    ),
                    onPressed: () {
                      setState(() {
                        Global.alldata.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: FloatingActionButton(
                  backgroundColor: Colors.black,
                  onPressed: () {
                    Navigator.pushNamed(context, 'detail');
                  },
                  child: Icon(Icons.add),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}