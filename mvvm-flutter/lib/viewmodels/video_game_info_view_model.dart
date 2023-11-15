import 'package:flutter/material.dart';
import 'package:mvvm_flutter/viewmodels/video_game_details_view_model.dart';
import 'package:mvvm_flutter/web_service.dart';

class VideoGameInfoViewModel extends ChangeNotifier {
  VideoGameDetailsViewModel? details;

  Future<void> fetchVideoGameDetails(int id) async {
    final results = await Webservice().fetchVideoGameDetails(id);
    details = VideoGameDetailsViewModel(videoGameDetails: results);
    notifyListeners();
  }
}
