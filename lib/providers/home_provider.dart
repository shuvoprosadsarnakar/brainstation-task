import 'package:brainstation/models/repository.dart';
import 'package:brainstation/services/repository_service.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  Repository? _repository;
  Repository? get repository => _repository;
  final RepositoryService repositoryService = RepositoryService();
  bool loading = false;

  HomeProvider() {
    getRepositories();
  }

  void getRepositories() async {
    try {
      loading = true;
      notifyListeners();
      _repository = await repositoryService.fetchRepositories(
          query: "flutter", perPage: 10, page: 1);
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}
