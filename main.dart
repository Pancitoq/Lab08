import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      initialRoute: Page.route,
      routes: {
        Page.route: (context) => Page(),
        LabRoute.route: (context) => LabRoute(),
      }
    );
    
  }
}


class Page extends StatelessWidget {

  static var route = "/";

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: ElevatedButton(
          child: Text("Pantallas"),
          onPressed: () => {
            Navigator.pushNamed(context, LabRoute.route)
          },
        ) 
      ),
    );
  }
}


class LabRoute extends StatelessWidget {

  static var route = "/labs";

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Lab08',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text("Laboratorio"),
      ),
        body: ListView.builder(
          itemCount: labs.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(labs[index].name),
              subtitle: Text(labs[index].project),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LabScreen(lab: labs[index]),
                  ),
                )
              },
            );
          }
        )
      )
    );
  }
}

class LabScreen extends StatelessWidget {
  final LabModel lab;

  LabScreen({required this.lab});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(lab.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Proyecto: ${lab.project}',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class LabModel {
  final String name;
  final String project;

  LabModel({required this.name, required this.project});
}

List<LabModel> labs = [
  LabModel(
    name: "Lab07", 
    project: "Lab07"
  ),
  LabModel(
    name: "Lab06", 
    project: "Lab06"
  ),
  LabModel(
    name: "Lab05", 
    project: "Lab05"
  ),
];
