import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _carroController = TextEditingController();

  TextEditingController _anoCoontroller = TextEditingController();
  TextEditingController _corController = TextEditingController();
  TextEditingController _anoController = TextEditingController();

  void _inserir() {
    setState(() {
      carros.insert(0, _carroController.text);
      corControoller.insert(
          0,
          int.tryParse(_anoCoontroller.text) != null
              ? int.parse(_anoCoontroller.text)
              : 0);
    });
  }

  _limparFormulario() {
    _carroController.text = "";
    _anoCoontroller.text = "";
    _corController.text = "";
  }

  final List<String> carros = <String>["FJK-39M", "BFK-39U", "SFK-20U"];
  final List<int> corControoller = <int>[40, 30, 20];

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
              keyboardType: TextInputType.number,
              controller: _anoCoontroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'quilômetro Rodado',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              keyboardType: TextInputType.name,
              controller: _corController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Cor do veiculo',
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
                  color: corControoller[index] >= 40
                      ? Colors.blue[400]
                      : corControoller[index] >= 30
                          ? Colors.blue[100]
                          : Colors.grey,
                  child: Center(
                    child: Text(
                      "placas ${carros[index]}  (${corControoller[index]} ${carros[index]})",
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
