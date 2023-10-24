import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: {
      "/": (context) => Listas(),
      "/Nova": (context) => NovaPagina(),
    });
  }
}

class NovaPagina extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Nova Pagina")),
    );
  }
}

class Listas extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListasState();
}

class _ListasState extends State<Listas> {
  List<String> nomes = [
    'João',
    'Maria',
    'Pedro',
    'Ana',
    'Lucas',
    'Isabela',
    'Mateus',
    'Larissa',
    'Gabriel',
    'Laura',
    'Guilherme',
    'Carolina',
    'Felipe',
    'Juliana',
    'Rafael',
    'Natália',
  ];

  buildAppBar() {
    return AppBar(
      title: const Text("Listas"),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/Nova');
            },
            icon: Icon(Icons.arrow_forward_ios))
      ],
    );
  }

  buildAppBarSelected() {
    return AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.delete_outline),
              onPressed: () {
                setState(() {
                  select.forEach((e) {
                    nomes.remove(e);
                  });

                  select = [];
                });
              }),
          IconButton(onPressed: () {}, icon: Icon(Icons.add))
        ],
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              setState(() {
                select = [];
              });
            }));
  }

  List<String> select = [];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: select.isEmpty ? buildAppBar() : buildAppBarSelected(),
      body: ListView.builder(
        itemCount: nomes.length,
        itemBuilder: (context, i) {
          return ListTile(
            leading: Container(
              decoration: BoxDecoration(
                  color: select.contains(nomes[i])
                      ? Colors.blueAccent
                      : Colors.greenAccent,
                  shape: BoxShape.circle),
              child: Text(nomes[i][0].toUpperCase()),
              width: 40,
              height: 40,
              alignment: Alignment.center,
            ),
            title: Text(nomes[i]),
            onTap: () {
              setState(() {
                nomes.removeAt(i);
              });
            },
            onLongPress: () {
              setState(() {
                select.add(nomes[i]);
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          nomes.add("alice");
        });
      }),
    );
  }
}
