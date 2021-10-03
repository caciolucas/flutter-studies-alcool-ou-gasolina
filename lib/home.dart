import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();

  var _resultado = "";

  void _calcular() {
    double? precoAlcool = double.tryParse(_controllerAlcool.text);
    double? precoGasolina = double.tryParse(_controllerGasolina.text);

    if(precoAlcool == null || precoGasolina == null) {
      setState(() {
        _resultado = "Número inválido, digite números maiores que 0 e utilizando (.)";
      });
    } else {
      setState(() {
        _resultado = (precoAlcool / precoGasolina >= 0.7) ? "Melhor abastecer com gasolina": "Melhor abastecer com álcool";
      });
    }
    _limparCampos();
  }
  void _limparCampos(){
    _controllerAlcool.text = "";
    _controllerGasolina.text = "";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Álcool ou Gasolina'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: Image.asset('lib/assets/logo.png'),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                    "Saiba qual a melhor opção para abastecimento do seu carro",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Preço do Álcool (ex: 3.34)",
                ),
                style: const TextStyle(fontSize: 20),
                controller: _controllerAlcool,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Preço da gasolina (ex: 6.34)",
                ),
                style: const TextStyle(fontSize: 20),
                controller: _controllerGasolina,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                    onPressed: _calcular,
                    child: Text("Calcular"),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        textStyle: MaterialStateProperty.all(
                            TextStyle(fontSize: 15)))),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  _resultado,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, ),
                ),
              ),
            ],
          ),
        ));
  }
}
