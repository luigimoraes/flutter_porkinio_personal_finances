import 'package:flutter/material.dart';
import 'package:porkinio/app/features/home/home_page.dart';
import 'package:porkinio/app/features/transaction_list/transaction_controller.dart';
import 'package:porkinio/app/features/transaction_list/transaction_form.dart';
import 'package:porkinio/app/models/transaction_model.dart';

enum ItemOptions { edit, delete }

class TransactionListTileOptionsButton extends StatefulWidget {
  const TransactionListTileOptionsButton({
    super.key,
    required this.model,
    required this.controller,
  });
  final TransactionModel model;
  final TransactionController controller;

  static const route = '/home-page';

  @override
  State<TransactionListTileOptionsButton> createState() =>
      _TransactionListTileOptionsButtonState();
}

class _TransactionListTileOptionsButtonState
    extends State<TransactionListTileOptionsButton> {
  ItemOptions? selectedMenu;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<ItemOptions>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      constraints: BoxConstraints(
        minWidth: MediaQuery.of(context).size.width * 0.4,
      ),
      icon: const Icon(
        Icons.more_horiz,
        color: Colors.grey,
      ),
      initialValue: selectedMenu,
      onSelected: (ItemOptions item) {
        setState(
          () {
            selectedMenu = item;
          },
        );
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<ItemOptions>>[
        PopupMenuItem<ItemOptions>(
          value: ItemOptions.edit,
          child: ListTile(
            title: Text(
              'Edit',
              style: Theme.of(context).textTheme.caption,
            ),
            trailing: const Icon(Icons.edit),
          ),
          onTap: () {
            Future.delayed(
              const Duration(seconds: 0),
              () => showDialog(
                context: context,
                builder: (context) => Center(
                  child: TransactionForm(
                    controller: widget.controller,
                    model: widget.model,
                  ),
                ),
              ),
            );
          },
        ),
        PopupMenuItem<ItemOptions>(
          value: ItemOptions.delete,
          child: ListTile(
            title: Text(
              'Delete',
              style: Theme.of(context).textTheme.caption,
            ),
            trailing: const Icon(Icons.delete),
            onTap: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text(
                      'Are you sure you want to delete this transaction?'),
                  content: Text(
                    'This action can not be undone.',
                    style: Theme.of(context).textTheme.overline?.copyWith(
                          color: Colors.redAccent,
                        ),
                  ),
                  actions: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                Colors.grey,
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('CANCEL'),
                          ),
                          ElevatedButton(
                            child: const Text('CONFIRM'),
                            onPressed: () async {
                              Navigator.of(context)
                                  .pushReplacementNamed(HomePage.route);
                              await widget.controller
                                  .deleteTransaction(widget.model);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
