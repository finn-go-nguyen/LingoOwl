import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/firestore/collection_name.dart';
import '../../../constants/type_defs/type_defs.dart';
import '../../../domain_manager.dart';
import '../../../utils/base_collection_reference.dart';
import '../model/video.dart';

final videoProvider =
    FutureProvider.family<LVideo, VideoId>((ref, videoId) async {
  final videoRepository =
      ref.watch(DomainManager.instance.videoRepositoryProvider);
  return videoRepository.fetchVideo(videoId);
});

abstract class VideoRepository {
  Future<LVideo> fetchVideo(VideoId videoId);
}

class FirestoreVideoRepository extends BaseCollectionReference<LVideo>
    implements VideoRepository {
  FirestoreVideoRepository(FirebaseFirestore firestore)
      : super(
          firestore.collection(CollectionName.video).withConverter(
                fromFirestore: (snapshot, options) =>
                    LVideo.fromJson(snapshot.data()!),
                toFirestore: (value, options) => value.toJson(),
              ),
        );

  @override
  Future<LVideo> fetchVideo(VideoId videoId) async {
    final result = await get(videoId);
    return result!;
  }
}
