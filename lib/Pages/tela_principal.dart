import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImcPage extends StatefulWidget {
  const ImcPage({super.key});

  @override
  State<ImcPage> createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculadora IMC',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.indigo,
        actions: [
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.refresh,
              color: Colors.white,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
              SizedBox(
                height: 25,
              ),
              Icon(
                Icons.person,
                size: 120.0,
                color: Colors.indigo,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text(
                    'Peso (Kg)',
                  ),
                  labelStyle: TextStyle(
                      color: Colors.indigo,
                      fontWeight: FontWeight.w700,
                      fontSize: 25),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.indigo, fontSize: 25.0),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text(
                    'Altura (Cm)',
                  ),
                  labelStyle: TextStyle(
                      color: Colors.indigo,
                      fontWeight: FontWeight.w700,
                      fontSize: 25),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.indigo, fontSize: 25.0),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Container(
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Colors.indigo,
                    ),
                    child: Text(
                      'Calcular',
                      style: TextStyle(color: Colors.white,fontSize: 25),
                    ),
                  ),
                ),
              ),
              Text(
                "info",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 25,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
