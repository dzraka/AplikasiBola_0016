import 'package:flutter/material.dart';
import 'package:mini_project/add_player.dart';
import 'package:mini_project/home_screen.dart';

class PlayerDetail extends StatefulWidget {
  final String name;
  final String position;
  final String number;
  final String nationality;
  final String age;
  final String height;
  final String gender;
  const PlayerDetail({
    super.key,
    required this.name,
    required this.position,
    required this.number,
    required this.nationality,
    required this.age,
    required this.height,
    required this.gender,
  });

  @override
  State<PlayerDetail> createState() => _PlayerDetailState();
}

class _PlayerDetailState extends State<PlayerDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFf181733),
        foregroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text("Rincian Pemain"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Card(
              color: Color(0xFFF5F5F5),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,

                      children: [
                        Text("Nama: ${widget.name}"),
                        Text("Posisi: ${widget.position}"),
                        Text("Nomor Punggung: ${widget.number}"),
                        Text("Kewarganegaraan: ${widget.nationality}"),
                        Text("Usia: ${widget.age}"),
                        Text("Tinggi Badan: ${widget.height} cm"),
                        Text("Jenis Kelamin: ${widget.gender}"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                    MaterialPageRoute(builder: (context) => AddPlayer()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF181733),
                  foregroundColor: Colors.white70,

                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text("Batal"),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF181733),
                  foregroundColor: Colors.white70,
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text("Simpan"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
