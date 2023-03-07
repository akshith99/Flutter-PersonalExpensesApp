import 'package:flutter/material.dart';
import 'package:flutter_complete_guidetwo/models/transaction.dart';

import 'transaction_item.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    print('build() transactionList');
    return transactions.isEmpty ? LayoutBuilder(builder:(context, constraints) {
      return Column(
        children: [
          Text('No Transactions added yet!' ,
              style: Theme.of(context).textTheme.headline6
          ),
          const SizedBox(height: 20),
          Container(
              height: constraints.maxHeight * 0.6,
              child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover
              )
          ),
        ],
      );
    },)  : ListView(
      children: [
        ...transactions.map((tx) => TransactionItem(
            key: ValueKey(tx.id),
            transaction: tx,
            deleteTx: deleteTx)
        ).toList()
      ],
      // itemCount: transactions.length,
    );
  }
}


