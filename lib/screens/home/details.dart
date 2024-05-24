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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                radius: 90,
                backgroundImage: NetworkImage(item.owner.avatarUrl),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              item.fullName,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            Text(
              item.description ?? "",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 10),
            Text(
              ' Updated at ${item.updatedAt ?? ""}',
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        ),
      ),
    );
  }
}
