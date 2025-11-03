import 'package:flutter/material.dart';
import 'package:mini_project/add_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF181733),
        foregroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsetsGeometry.all(8.0),
          child: Image.asset("assets/images/logo.png"),
        ),
        title: const Text(
          "FC Barcelona",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Row(children: [Text("Jadwal Pertandingan FC Barcelona")]),

            SizedBox(height: 20),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("FC Barcelona"),
                        Text("VS"),
                        Text("Real Madrid"),
                      ],
                    ),

                    SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("Tanggal: ")],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("Waktu: ")],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("Lokasi: ")],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 30),

            Row(children: [Text("Menu")]),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddPlayer()),
                        );
                      },
                      icon: Icon(Icons.people),
                    ),
                    Text("Pemain"),
                  ],
                ),
                Column(
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.schedule)),
                    Text("Jadwal"),
                  ],
                ),
                Column(
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.bar_chart)),
                    Text("Klasemen"),
                  ],
                ),
                Column(
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.store)),
                    Text("Store"),
                  ],
                ),
              ],
            ),

            SizedBox(height: 40),

            Row(children: [Text("Berita Terkini")]),
          ],
        ),
      ),
    );
  }
}
