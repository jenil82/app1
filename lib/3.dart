import 'package:exam/modalClass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  TextEditingController sidc = TextEditingController();
  TextEditingController snamec = TextEditingController();
  TextEditingController sstdc = TextEditingController();

  String? sid;
  String? sname;
  String? sstd;

  GlobalKey<FormState> datakey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: datakey,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.black,
            title: Text(
              "Student Detail",
              style: TextStyle(fontSize: 20),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: sidc,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Your ID...";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    setState(() {
                      sid = newValue;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Enter Your ID",
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: snamec,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Your Name...";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    setState(() {
                      sname = newValue;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Enter Your Name",
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: sstdc,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Your STD...";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    setState(() {
                      sstd = newValue;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Enter Your STD",
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    if (datakey.currentState!.validate()) {
                      datakey.currentState!.save();
                      ModalClass m1 = ModalClass(
                        sid: sidc.text,
                        sname: snamec.text,
                        sstd: sstdc.text,
                      );
                      setState(() {
                        Global.alldata.add(m1);
                      });
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/', (route) => false);
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 100,
                    child: Text(
                      "Submit",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}