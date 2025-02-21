import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImcPage extends StatefulWidget {
  const ImcPage({super.key});

  @override
  State<ImcPage> createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _ifoText = "Info";

  void resetFelds() {
    weightController.text = '';
    heightController.text = '';
    setState(() {
      _ifoText = "Informe Seus Dados!";
    });
  }

  void calculate() {

    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);
      if (imc < 18.6) {
        _ifoText = 'Abaixo do Peso: IMC=(${imc.toStringAsPrecision(3)})';
      }else if (imc >= 18.6 && imc < 24.9) {
        _ifoText = 'Peso Ideal: IMC=(${imc.toStringAsPrecision(3)})';
      }else if (imc >= 24.9 && imc < 29.9) {
        _ifoText = 'Levemente Acima do Peso: IMC=(${imc.toStringAsPrecision(3)})';
      }else if (imc >= 29.9 && imc < 34.9) {
        _ifoText = 'Obesidade Grau I : IMC=(${imc.toStringAsPrecision(3)})';
      }else if (imc >= 34.9 && imc < 39.9) {
        _ifoText = 'Obesidade Grau II : IMC=(${imc.toStringAsPrecision(3)})';
      }else {
        _ifoText = 'Obesidade Grau III : IMC=(${imc.toStringAsPrecision(3)})';
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculadora IMC',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800
          ),
        ),
        backgroundColor: Colors.indigo,
        actions: [
          IconButton(
            onPressed: resetFelds,
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
          child: Form(
            key: _formKey,
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
                TextFormField(
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Insira seu Peso';
                    }
                  },

                  controller: weightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.indigo,
                      ),
                    ),
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
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Insira sua Altura';
                    }
                  },
                  controller: heightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.indigo,
                      ),
                    ),
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
                      onPressed: (){
                        if(_formKey.currentState!.validate()){
                          calculate();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: Colors.indigo,
                      ),
                      child: Text(
                        'Calcular',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                ),
                Text(
                  _ifoText,
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
      ),
    );
  }
}
