// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:permission_handler/permission_handler.dart';

import '../Home/Home.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controllers
  final nameController = TextEditingController();
  final apelidoController = TextEditingController();

  // hive box

  var BoolBox = Hive.box<bool>("BoolBox");
  var StringBox = Hive.box<String>("StringBox");

  // verifica se o maldito do usuario finalizou a introdução
  late bool isSeen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const Icon(
                Icons.lock,
                size: 80,
              ),
              const SizedBox(height: 50),
              const Text(
                'Bem Vindo!',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 25),
              MyTextField(
                controller: nameController,
                hintText: 'Nome Completo',
                obscureText: false,
                lenght: 25,
              ),
              const SizedBox(height: 10),
              MyTextField(
                controller: apelidoController,
                hintText: 'Apelido',
                obscureText: false,
                lenght: 10,
              ),
              const SizedBox(height: 20),
              MyButton(
                onTap: () async {
                  //permissões
                  var ActivityPermission =
                      await Permission.activityRecognition.request();
                  var Notifications = Permission.notification.request();

                  //verifica se os campos estão preenchidos
                  if (apelidoController.text.isNotEmpty &&
                      nameController.text.isNotEmpty) {
                    if (ActivityPermission.isDenied) {
                      snackBar(
                          context, 'Aceite todas as permissões para continuar');
                    }

                    if (ActivityPermission.isGranted) {
                      snackBar(context, 'Seja bem vindo!');

                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Home()));

                      isSeen = true;

                      BoolBox.put('isSeen', isSeen);
                      StringBox.putAll({
                        'nome': nameController.text,
                        'apelido': apelidoController.text
                      });

                      print(apelidoController.text);
                      print(nameController.text);
                    }
                  }
                  //verifica se os campos não estão preenchidos (o else não funciona corretamente nesse caso)
                  if (apelidoController.text.isEmpty &&
                      nameController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.white,
                      content: const Text(
                        'Preeencha todos os campos para continuar.',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      duration: const Duration(milliseconds: 1500),
                      width: 280.0,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ));
                  }
                },
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final Function()? onTap;

  const MyButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Text(
            "Entrar",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final int lenght;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.lenght,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        maxLength: lenght,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            fillColor: Colors.grey.shade200,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[500])),
      ),
    );
  }
}

void snackBar(context, texto) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.white,
    content: Text(
      texto,
      style: TextStyle(fontSize: 20, color: Colors.black),
    ),
    duration: const Duration(milliseconds: 1500),
    width: 280.0,
    padding: const EdgeInsets.symmetric(
      horizontal: 16.0,
    ),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  ));
}
