import 'package:al_oficial_app/components/exchange-unit.dart';
import 'package:al_oficial_app/models/exchanges.dart';
import 'package:flutter/material.dart';

class ListFilteredStream extends StatefulWidget {
  const ListFilteredStream({Key key}) : super(key: key);

  @override
  _ListFilteredStream createState() => _ListFilteredStream();
}

class _ListFilteredStream extends State<ListFilteredStream> {
  final Exchanges exchanges = Exchanges();
  String dropdownValue = '';
  String searchValue = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 45),
        child: ListView(
            primary: false,
            padding: EdgeInsets.only(left: 25.0, right: 20.0),
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                      child: TextFormField(
                          onChanged: (String newSearch) {
                            setState(() {
                              searchValue = newSearch;
                            });
                          },
                          decoration: const InputDecoration(
                            hintText: 'Filtrar Busqueda',
                          ))),
                  DropdownButton(
                    value: dropdownValue,
                    icon: Icon(Icons.arrow_downward),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: [
                      DropdownMenuItem(value: '', child: Text('Cambio:')),
                      DropdownMenuItem(
                          value: 'VES/USD', child: Text('VES/USD')),
                      DropdownMenuItem(
                          value: 'VES/PTR', child: Text('VES/PTR')),
                      DropdownMenuItem(value: 'VES/BTC', child: Text('VES/BTC'))
                    ],
                  ),
                ],
              ),
              Container(
                  height: MediaQuery.of(context).size.height - 300,
                  child: StreamBuilder(
                      stream: exchanges.getData(Duration(minutes: 1)),
                      initialData: [],
                      builder: (context, snapshot) {
                        if (snapshot.data == null)
                          return Expanded(
                              flex: 1,
                              child:
                                  Container(
                                      child: Text('Error de Conexion')));
                        List showList;
                        if (dropdownValue == '')
                          showList = snapshot.data;
                        else {
                          showList = snapshot.data.where((item) {
                            return item.pair == dropdownValue;
                          }).toList();
                        }
                        showList = showList.where((item) {
                          return item.name.startsWith(searchValue);
                        }).toList();
                        return ListView(
                            children: List.generate(
                                showList.length,
                                (index) =>
                                    ExchangeUnit(data: showList[index])));
                      }))
            ]));
  }
}
