import 'package:brainstation/models/repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Details extends StatelessWidget {
  const Details({
    super.key,
    required this.item,
  });

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          context.pop();
        },
      )),
      body: Column(
        children: [Text(item.fullName)],
      ),
    );
  }
}
