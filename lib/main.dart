import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Posttest 3",
      theme: ThemeData(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controllerDepan = TextEditingController();
  String nama = "";

  List<String> role = ["duelist", "sentinel", "initiator", "smoker"];
  String roleGroup = "";

  @override
  void dispose() {
    controllerDepan.dispose();
    super.dispose();
  }

  void hapusValue() {
    controllerDepan.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posttest 3 M.Fahreza"),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                child: Text("Pemilihan Agent"),
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 45),
              ),
              Row(
                children: [
                  Container(
                    width: 160,
                    height: 230,
                    margin: EdgeInsets.only(top: 61),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/jet.jpg"),
                      ),
                    ),
                  ),
                  Container(
                    width: 160,
                    height: 230,
                    margin: EdgeInsets.only(top: 61),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/killjoy.jpg"),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          TextField(
            maxLines: 3,
            controller: controllerDepan,
            decoration: InputDecoration(
              hintText: "Masukkan Nama Agent : ",
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.redAccent)),
            ),
          ),
          for (var item in role)
            Row(
              children: [
                Radio(
                  value: item,
                  groupValue: roleGroup,
                  onChanged: (newValue) {
                    setState(() {
                      roleGroup = newValue.toString();
                    });
                  },
                ),
                Text(item),
              ],
            ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                nama = controllerDepan.text;
                hapusValue();
              });
            },
            child: Text("Submit"),
          ),
          Text("Nama : $nama"),
          Text("Role nya : $roleGroup"),
        ],
      ),
    );
  }
}
