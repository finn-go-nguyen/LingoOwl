import 'package:freezed_annotation/freezed_annotation.dart';

part 'video.freezed.dart';
part 'video.g.dart';

@freezed
class LVideo with _$LVideo {
  const factory LVideo({
    /// seconds
    required int duration,

    /// "1080" : "url1"
    required Map<String, String> urls,
  }) = _LVideo;

  factory LVideo.fromJson(Map<String, Object?> json) => _$LVideoFromJson(json);
}
