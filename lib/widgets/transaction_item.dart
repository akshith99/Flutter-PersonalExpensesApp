import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {

  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {

  Color _bgColor;

  @override
  void initState() {
    super.initState();
    const availableColors = [
      Colors.red,
      Colors.black,
      Colors.blue,
      Colors.purple
    ];
    setState(() {

    });
    _bgColor = availableColors[Random().nextInt(4)];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(
                child: Text('\$${widget.transaction.amount.toStringAsFixed(2)}')
            ),
          ),
        ),
        title: Text(widget.transaction.title,
          style: Theme.of(context).textTheme.headline6,),
        subtitle: Text(
            DateFormat.yMMMd().format(widget.transaction.date)
        ),
        trailing: MediaQuery.of(context).size.width > 460 ?
        FlatButton.icon(
          textColor: Theme.of(context).errorColor,
          icon: const Icon(Icons.delete),
          label: const Text('Delete'),
          onPressed: () {
            widget.deleteTx(widget.transaction.id);
          },
        ) : IconButton(
          icon: const Icon(Icons.delete),
          color: Theme.of(context).errorColor,
          onPressed: () {
            widget.deleteTx(widget.transaction.id);
          },
        ),
      ),
    );
  }
}