import 'package:flutter/material.dart';
import 'package:mini_project/player_detail.dart';

enum Gender { male, female }

enum Position { forward, midfielder, defender, goalkeeper }

class AddPlayer extends StatefulWidget {
  const AddPlayer({super.key});

  @override
  State<AddPlayer> createState() => _AddPlayerState();
}

class _AddPlayerState extends State<AddPlayer> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtr = TextEditingController();
  // final _posCtr = TextEditingController();
  final _numbCtr = TextEditingController();
  final _nationalityCtr = TextEditingController();
  final _ageCtr = TextEditingController();
  final _heightCtr = TextEditingController();

  Gender? _selectedGender = Gender.male;
  Position? _selectedPosition = Position.forward;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF181733),
        foregroundColor: Colors.white,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
        title: Text(
          "Tambah Pemain Baru",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // nama
                TextFormField(
                  controller: _nameCtr,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "masukkan nama pemain";
                    }
                    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                      return "nama hanya boleh berisi huruf";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    label: Text("Nama Pemain"),
                    hintText: "masukkan nama pemain",
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),

                SizedBox(height: 10),

                // posisi
                // TextFormField(
                //   controller: _posCtr,
                //   validator: (value) {
                //     if (value!.isEmpty) {
                //       return "masukkan posisi pemain";
                //     }
                //     return null;
                //   },
                //   keyboardType: TextInputType.text,
                //   decoration: InputDecoration(
                //     label: Text("Posisi Pemain"),
                //     hintText: "masukkan posisi pemain",
                //   ),
                //   autovalidateMode: AutovalidateMode.onUserInteraction,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Posisi Pemain", style: TextStyle(fontSize: 16)),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile<Position>(
                        title: Text(
                          "Penyerang",
                          style: TextStyle(fontSize: 14),
                        ),
                        value: Position.forward,
                        groupValue: _selectedPosition,
                        onChanged: (Position? value) {
                          setState(() {
                            _selectedPosition = value;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<Position>(
                        title: Text(
                          "Gelandang",
                          style: TextStyle(fontSize: 14),
                        ),
                        value: Position.midfielder,
                        groupValue: _selectedPosition,
                        onChanged: (Position? value) {
                          setState(() {
                            _selectedPosition = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile<Position>(
                        title: Text(
                          "Penjaga Gawang",
                          style: TextStyle(fontSize: 14),
                        ),
                        value: Position.goalkeeper,
                        groupValue: _selectedPosition,
                        onChanged: (Position? value) {
                          setState(() {
                            _selectedPosition = value;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<Position>(
                        title: Text("Bek", style: TextStyle(fontSize: 14)),
                        value: Position.defender,
                        groupValue: _selectedPosition,
                        onChanged: (Position? value) {
                          setState(() {
                            _selectedPosition = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10),

                // nomor punggung
                TextFormField(
                  controller: _numbCtr,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "masukkan nomor punggung pemain";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text("Nomor Punggung"),
                    hintText: "masukkan nomor punggung pemain (1-99)",
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),

                SizedBox(height: 10),

                // kewarganegaraan
                TextFormField(
                  controller: _nationalityCtr,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "masukkan kewarganegaraan pemain";
                    }
                    if (!RegExp(r'^[a-zA-Z\s] + $').hasMatch(value)) {
                      return "kewarganegaraan hanya boleh berisi huruf";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    label: Text("Kewarganegaraan"),
                    hintText: "masukkan kewarganegaraan pemain",
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),

                SizedBox(height: 10),

                // usia
                TextFormField(
                  controller: _ageCtr,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "masukkan usia pemain";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text("Usia pemain"),
                    hintText: "masukkan usia pemain",
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),

                SizedBox(height: 10),

                // tinggi badan
                TextFormField(
                  controller: _heightCtr,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "masukkan tinggi pemain";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text("Tinggi pemain (cm)"),
                    hintText: "masukkan tinggi pemain",
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),

                SizedBox(height: 10),

                // jenis kelamin
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Jenis Kelamin", style: TextStyle(fontSize: 16)),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile<Gender>(
                        title: const Text(
                          'Laki-laki',
                          style: TextStyle(fontSize: 14),
                        ),
                        value: Gender.male,
                        groupValue: _selectedGender,
                        onChanged: (Gender? value) {
                          setState(() {
                            _selectedGender = value;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<Gender>(
                        title: const Text(
                          'Perempuan',
                          style: TextStyle(fontSize: 14),
                        ),
                        value: Gender.female,
                        groupValue: _selectedGender,
                        onChanged: (Gender? value) {
                          setState(() {
                            _selectedGender = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 30),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlayerDetail(),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF181733),
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        "Tambah Pemain",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
