import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty ? Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text(
            'Nenhuma transação cadastrada!',
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 200,
            child: Image.asset(
              'assets/images/waiting.png', 
              fit: BoxFit.cover,
            ),
          ),
        ],
      ) : ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, index) {
          final tr = transactions[index];
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 5,
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
                radius: 30,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: FittedBox(
                    child: Text(
                      'R\$${tr.value}'
                    ),
                  ),
                ),
              ),
              title: Text(
                tr.title,
                style: Theme.of(context).textTheme.headline6,
              ),
              subtitle: Text(
                DateFormat('d MMM y').format(tr.date),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                color: Colors.red[800],
                onPressed: () => onRemove(tr.id),
              ),
            ),
          );
        },
      ),
    );
  }
}
