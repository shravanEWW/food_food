import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Headline',
              style: TextStyle(fontSize: 18),
            ),
            Expanded(
              child: ListView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: (BuildContext context, int index) => Card(
                  child: Center(child: Text('Dummy Card Text')),
                ),
              ),
            ),
            Text(
              'Demo Headline 2',
              style: TextStyle(fontSize: 18),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (ctx,int){
                  return Card(
                    child: ListTile(
                        title: Text('Motivation $int'),
                        subtitle: Text('this is a description of the motivation')),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
