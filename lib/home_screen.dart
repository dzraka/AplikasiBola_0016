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
      backgroundColor: Colors.white,
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
              color: Color(0xFFF5F5F5),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("FC Barcelona"),
                        Text("VS"),
                        Text("Chealsea FC"),
                      ],
                    ),

                    SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("Tanggal: 26 Novemer 2025")],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("Waktu: 03.00 WIB")],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("Lokasi: Stamford Bridge")],
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

            SizedBox(height: 20),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildNewsCard(
                    "Barcelona vs Elche: Yamal dan Rashford Nyekor, Blaugrana Kembali ke Jalur Kemenangan",
                    "Pada laga lanjutan Liga Spanyol 2025/26, Barcelona menang 3-1 atas Elche CF di Stadion Montjuïc, Minggu malam waktu setempat. Gol dicetak oleh Lamine Yamal, Ferran Torres dan Marcus Rashford. Kemenangan ini membawa Barcelona ke posisi kedua klasemen sementara, meskipun masih tertinggal dari Real Madrid.",
                  ),
                  _buildNewsCard(
                    "Barcelona Siap Permanenkan Marcus Rashford, tapi dengan Syarat Berat",
                    "Barcelona dikabarkan siap mengambil opsi pembelian permanen atas status peminjaman Marcus Rashford dari Manchester United. Namun, kesepakatan ini dikabarkan akan bergantung pada sang pemain bersedia melakukan pemotongan gaji besar karena kondisi keuangan klub.",
                  ),
                  _buildNewsCard(
                    "Barcelona vs Olympiakos 6-1: Fermín cetak hat-trick, Rashford dua gol",
                    "Barcelona meraih kemenangan gemilang 6-1 atas Olympiakos di pertandingan Liga Champions matchday 3 tanggal 21 Oktober 2025. Gol-gol dicetak oleh Fermín López yang mencetak hat-trick, Marcus Rashford dua gol, dan penalti dari Lamine Yamal. Kemenangan ini menjadi dorongan besar moral bagi Barca menjelang laga besar melawan rivalnya.",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNewsCard(String title, String content) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 8),
          Text(content, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
