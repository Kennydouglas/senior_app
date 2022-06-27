import 'package:flutter/material.dart';
import 'package:senior_test/main_controller.dart';
import 'package:senior_test/main_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Senior/Mega Teste',
      theme: ThemeData(
          primarySwatch: const MaterialColor(0xFF00D9B6, {
        50: Color(0xFF00D9B6),
        100: Color(0xFF00D9B6),
        200: Color(0xFF00D9B6),
        300: Color(0xFF00D9B6),
        400: Color(0xFF00D9B6),
        500: Color(0xFF00D9B6),
        600: Color(0xFF00D9B6),
        700: Color(0xFF00D9B6),
        800: Color(0xFF00D9B6),
        900: Color(0xFF00D9B6),
      })),
      home: const MyHomePage(title: 'Senior/Mega Teste'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var movieNameController = TextEditingController();
  MainController mainController = MainController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC6CEC8),
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title, style: const TextStyle(color: Colors.white)),
      ),
      body: Container(
        padding: const EdgeInsets.only(bottom: 30),
        height: double.infinity,
        child: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 30.0),
              const Text(
                "Enter movie name:",
                style: TextStyle(fontSize: 18.0),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 240.0,
                    height: 48.0,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Colors.white,
                    ),
                    child: SizedBox.expand(
                      child: TextFormField(
                        controller: movieNameController,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Name",
                          contentPadding: EdgeInsets.only(left: 10),
                          labelStyle: TextStyle(
                            fontFamily: "OpenSans",
                            color: Color(0xFFD0C9D6),
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  ElevatedButton(
                    onPressed: () async {
                      String name = movieNameController.text;
                      mainController.consultMovie(name);
                    },
                    child: const Text("Set"),
                  ),
                ],
              ),
              const SizedBox(height: 30.0),
              StreamBuilder(
                  stream: mainController.output,
                  builder: (context, AsyncSnapshot snapshot) {
                    return Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: mainController.movies.length,
                        itemBuilder: (context, int currentIndex) {
                          return createViewItem(
                            mainController.movies[currentIndex],
                            context,
                          );
                        },
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget createViewItem(Movies missoes, BuildContext context) {
    return StreamBuilder(
        stream: mainController.output,
        builder: (context, AsyncSnapshot snapshot) {
          return Container(
            width: 300,
            height: 100,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            margin: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
            //padding:
            //    const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text("Year:"),
                        Text(missoes.year.toString()),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text("Movies:"),
                        Text(missoes.movies.toString()),
                      ],
                    ),
                  ]),
            ),
          );
        });
  }
}
