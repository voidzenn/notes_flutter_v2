import 'package:flutter/material.dart';

class CwCard extends StatelessWidget {
  final Widget content;
  final Widget button;
  final void Function() callback;

  const CwCard(
      {Key? key,
      required this.content,
      required this.button,
      required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.fromLTRB(20, 15, 15, 20),
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: const BorderSide(color: Colors.black12)),
        child: InkWell(
          onTap: () {
            callback();
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 15, 15, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                content,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [button],
                )
              ],
            ),
          ),
        ));
  }
}
