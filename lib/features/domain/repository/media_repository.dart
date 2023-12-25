import 'dart:io';
import '../../../core/resources/data_state.dart';

abstract class MediaRepository {
  // API remote
  Future<DataState<List<String>>> uploadMedia(
      List<File> media, String typeMedia);
}
