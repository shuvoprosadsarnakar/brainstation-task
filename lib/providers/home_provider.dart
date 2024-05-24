import 'package:brainstation/models/repository.dart';
import 'package:brainstation/services/repository_service.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  Repository? _repository;
  Repository? get repository => _repository;
  final RepositoryService repositoryService = RepositoryService();
  bool loading = false;
  int page = 1;
  HomeProvider() {
    getRepositories();
  }

  void getRepositories() async {
    if (loading) {
      return;
    }
    try {
      if (page == 1) {
        loading = true;
        notifyListeners();
        _repository = await repositoryService.fetchRepositories(
            query: "flutter", perPage: 20, page: page);
        page++;
      } else {
        loading = true;
        notifyListeners();
        final repo = await repositoryService.fetchRepositories(
            query: "flutter", perPage: 10, page: page);
        _repository?.items.addAll(repo.items);
        page++;
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}
