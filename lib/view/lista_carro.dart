import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _carroController = TextEditingController();

  TextEditingController _anoController = TextEditingController();
  TextEditingController _corController = TextEditingController();

  void _inserir() {
    setState(() {
      carros.insert(0, _carroController.text);
      anoController.insert(
          0,
          int.tryParse(_anoController.text) != null
              ? int.parse(_anoController.text)
              : 0);

      corController.insert(0, _corController.text);
    });
  }

  _limparFormulario() {
    _carroController.text = "";
    _anoController.text = "";
    _corController.text = "";
  }

  final List<String> carros = <String>["FJK-39M", "BFK-39U", "SFK-20U"];
  final List<String> corController = ['Vermelho', 'Azul', 'Branco'];

  List<int> anoController = [2023, 2000, 2019];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de carros"),

        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _limparFormulario,
          )
        ],

        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        //backgroundColor: Colors.brown,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: _carroController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Placa',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: _corController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Cor do Veiculo',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: _anoController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Ano do veiculo',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _inserir,
            child: Text("Inserir"),
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).primaryColor,
            ),
          ),
          ElevatedButton(
            onPressed: _limparFormulario,
            child: Text("Limpar"),
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).primaryColor,
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: carros.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  margin: EdgeInsets.all(2.0),
                  color: anoController[index] >= 2010
                      ? Colors.blue[400]
                      : anoController[index] >= 2020
                          ? Colors.blue[100]
                          : Colors.grey,
                  child: Center(
                    child: Text(
                      "placas ${carros[index]}  cor : ${corController[index]} ano ${anoController[index]}",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
