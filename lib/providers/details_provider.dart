import 'package:brainstation/models/post.dart';
import 'package:flutter/material.dart';

class DetailsProvider with ChangeNotifier {
  Post? _post;
  Post? get post => _post;
  bool loading = false;
  //final postService = PostService();

  // DetailsProvider() {}

  void getPostDetails(int id) async {
    try {
      loading = true;
      notifyListeners();
      //_post = await postService.fetchPostDetails(id);
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}
