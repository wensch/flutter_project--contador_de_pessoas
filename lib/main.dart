import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
	runApp(MaterialApp(
			title: "Contador de pessoas",
			home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
	var _infoText = "Pode entrar!";
	var _people = 0;

	_changePeople(delta) {
		setState(() {
			_people += delta;

			if (_people < 0) {
				_infoText = "Mundo invertido!?";
				_people = -1;
			} else if (_people <= 10) {
				_infoText = "Pode entrar!";
			} else {
				_infoText = "Lotado!";
				_people = 10;
			}
		});
	}

	@override
  Widget build(BuildContext context) {
    return Stack(
					children: <Widget>[
						Image.asset(
							"images/restaurante.jpg",
							fit: BoxFit.cover,
							height: 10000,
						),
						Column(
							mainAxisAlignment: MainAxisAlignment.center,
							children: <Widget>[
								Text("Pessoas: $_people",
										style:
										TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
								Row(
									mainAxisAlignment: MainAxisAlignment.center,
									children: <Widget>[
										Padding(
											padding: EdgeInsets.all(10),
											child: FlatButton(
												child: Text(
														"+1", style: TextStyle(fontSize: 40, color: Colors.white)),
												onPressed: () {
													_changePeople(1);
												},
											),
										),
										Padding(
											padding: EdgeInsets.all(10),
											child: FlatButton(
												child: Text(
														"-1", style: TextStyle(fontSize: 40, color: Colors.white)),
												onPressed: () {
													_changePeople(-1);
												},
											),
										),
									],
								),
								Text(_infoText,
										style: TextStyle(
												color: Colors.white,
												fontStyle: FontStyle.italic,
												fontSize: 30)),
							],
						)
					],
				);
  }
}
