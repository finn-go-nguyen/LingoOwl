import 'package:freezed_annotation/freezed_annotation.dart';

part 'video.freezed.dart';
part 'video.g.dart';

@freezed
class LVideo with _$LVideo {
  const factory LVideo({
    /// seconds
    required int duration,
    required String url,
  }) = _LVideo;

  factory LVideo.fromJson(Map<String, Object?> json) => _$LVideoFromJson(json);
}
