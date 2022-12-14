import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 158, 142, 142),
          appBarTheme: const AppBarTheme(
              backgroundColor: Color.fromARGB(255, 207, 162, 25))),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final items = List<String>.generate(15, (index) => "Note ${index + 1}");

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    TextEditingController textController = TextEditingController();

    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  items.clear();
                });
              },
              icon: const Icon(Icons.clear_all))
        ],
        centerTitle: true,
        title: const Text("TODO"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        mini: false,
        elevation: 20,
        tooltip: "Adding TODO",
        backgroundColor: const Color.fromARGB(255, 207, 162, 25),
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return SizedBox(
                  height: 110,
                  child: Center(
                      child: Column(
                    children: [
                      TextField(
                        controller: textController,
                        decoration: const InputDecoration(
                            hintText: 'New Todo', border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (textController.text.isNotEmpty) {
                                items.add(textController.text);
                              }
                            });
                            Navigator.pop(context);
                          },
                          child: const Text("Add"),
                        ),
                      )
                    ],
                  )),
                );
              });
        },
      ),
      body: items.isNotEmpty
          ? Padding(
              padding: mediaQuery.viewInsets,
              child: SingleChildScrollView(
                child: SizedBox(
                  height: mediaQuery.size.height - mediaQuery.padding.top - 140,
                  child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return Card(
                          elevation: 20,
                          margin: const EdgeInsets.all(20),
                          shadowColor: Colors.amber,
                          child: Dismissible(
                            key: UniqueKey(),
                            background: Container(color: Colors.red),
                            onDismissed: (direction) {
                              setState(() {
                                items.removeAt(index);
                              });

                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text("$item has been deleted")));
                            },
                            child: ListTile(
                              title: Center(child: Text(items[index])),
                            ),
                          ),
                        );
                      }),
                ),
              ),
            )
          : Padding(
              padding: mediaQuery.viewInsets,
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(30),
                  child: Column(children: [
                    const Text("you have no TODOs yet.",
                        style: TextStyle(
                            color: Color.fromARGB(255, 247, 233, 233),
                            fontSize: 18)),
                    const SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: SizedBox(
                          height: 500,
                          child: Image.asset('assets/waiting.png')),
                    )
                  ]),
                ),
              ),
            ),
    );
  }
}
