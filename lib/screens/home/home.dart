import 'package:brainstation/providers/home_provider.dart';
import 'package:brainstation/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Repositories"),
      ),
      body: Consumer<HomeProvider>(builder: (context, data, child) {
        return data.loading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemBuilder: (context, index) => ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            data.repository?.items[index].owner.avatarUrl ??
                                ""),
                      ),
                      title: Text(
                        ' ${data.repository?.items[index].owner.login ?? ""}/${data.repository?.items[index].name ?? ""}',
                      ),
                      subtitle: Row(
                        children: [
                          const Icon(Icons.star_border_outlined),
                          const SizedBox(width: 3),
                          Text(k_m_b_generator(
                              data.repository?.items[index].stargazersCount ??
                                  0)),
                        ],
                      ),
                      trailing:
                          Text(data.repository?.items[index].language ?? ""),
                      onTap: () {
                        GoRouter.of(context).pushNamed("details", extra: data.repository?.items[index]);
                      },
                    ),
                itemCount: data.repository?.items.length ?? 0);
      }),
    );
  }
}
