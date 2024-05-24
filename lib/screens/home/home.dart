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
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<HomeProvider>().getRepositories();
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.90);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Repositories"),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(3.0),
            child: Consumer<HomeProvider>(builder: (context, data, child) {
              return data.loading
                  ? const LinearProgressIndicator()
                  : const SizedBox.shrink();
            })),
      ),
      body: Consumer<HomeProvider>(builder: (context, data, child) {
        return data.repository == null
            ? const Center(child: Text("Empty"))
            : ListView.builder(
                controller: _scrollController,
                itemCount: data.repository?.items.length ?? 0,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        data.repository?.items[index].owner.avatarUrl ?? ""),
                  ),
                  title: Text(
                    ' ${data.repository?.items[index].owner.login ?? ""}/${data.repository?.items[index].name ?? ""}',
                  ),
                  subtitle: Row(
                    children: [
                      const Icon(Icons.star_border_outlined),
                      const SizedBox(width: 3),
                      Text(k_m_b_generator(
                          data.repository?.items[index].stargazersCount ?? 0)),
                    ],
                  ),
                  trailing: Text(data.repository?.items[index].language ?? ""),
                  onTap: () {
                    GoRouter.of(context).pushNamed("details",
                        extra: data.repository?.items[index]);
                  },
                ),
              );
      }),
    );
  }
}
