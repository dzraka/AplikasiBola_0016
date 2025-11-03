import 'package:flutter/material.dart';
import 'package:mini_project/login_screen.dart';

enum Gender { male, female }

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtr = TextEditingController();
  final _domCtr = TextEditingController();
  final _phoneCtr = TextEditingController();
  final _emailCtr = TextEditingController();
  final _pwdCtr = TextEditingController();
  final _confirmPwdCtr = TextEditingController();

  bool isObscure = true;
  Gender? _selectedGender = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pendaftaran")),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameCtr,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "nama tidak boleh kosong";
                      }
                      if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                        return "nama hanya boleh berisi huruf";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      label: Text("Nama"),
                      hintText: "masukkan nama",
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),

                  SizedBox(height: 10),

                  TextFormField(
                    controller: _domCtr,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "alamat tidak boleh kosong";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                      label: Text("Alamat"),
                      hintText: "masukkan alamat",
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),

                  SizedBox(height: 10),

                  TextFormField(
                    controller: _phoneCtr,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "nomor telepon tidak boleh kosong";
                      }
                      if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                        return "nomor telepon hanya boleh berisi angka";
                      }
                      if (value.length < 10 || value.length > 15) {
                        return "nomor telepon harus terdiri dari 10-15 digit";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      label: Text("Nomor Telepon"),
                      hintText: "masukkan no. telp",
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),

                  SizedBox(height: 10),

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
                  const SizedBox(height: 10),

                  TextFormField(
                    controller: _emailCtr,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "email tidak boleh kosong";
                      } else if (!value.contains("@gmail.com")) {
                        return "harus dengan format @gmail.com";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      label: Text("Email"),
                      hintText: "masukkan email, ex: nama@gmail.com",
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),

                  const SizedBox(height: 10),

                  TextFormField(
                    controller: _pwdCtr,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "password tidak boleh kosong";
                      } else if (value.length < 6) {
                        return "password harus terdiri dari minimal 6 karakter";
                      }
                      return null;
                    },
                    obscureText: isObscure,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      label: Text("Password"),
                      hintText: "masukkan password",
                      suffixIcon: IconButton(
                        icon: Icon(
                          isObscure ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),

                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _confirmPwdCtr,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "password tidak boleh kosong";
                      } else if (value != _pwdCtr.text) {
                        return "password tidak sama";
                      }
                      return null;
                    },
                    obscureText: isObscure,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      label: Text("Konfirmasi Password"),
                      hintText: "masukkan ulang password",
                      suffixIcon: IconButton(
                        icon: Icon(
                          isObscure ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),

                  const SizedBox(height: 30),

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
                                builder: (context) => LoginScreen(
                                  email: _emailCtr.text,
                                  pwd: _confirmPwdCtr.text,
                                ),
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
                          "Daftar",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Sudah memiliki akun? ",
                        style: TextStyle(color: Colors.black38, fontSize: 16),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(
                                email: _emailCtr.text,
                                pwd: _confirmPwdCtr.text,
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          "Masuk",
                          style: TextStyle(
                            color: Color(0xFFEEBC00),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
