import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_view_state.freezed.dart';

@freezed
class VideoViewState with _$VideoViewState {
  const factory VideoViewState({
    @Default(false) bool isInitialized,
    @Default(false) bool showController,
    @Default(AsyncLoading()) AsyncValue<void> status,
    @Default(false) bool isPlaying,
    @Default(Duration()) Duration position,
    @Default(Duration()) Duration duration,
  }) = _VideoViewState;
}
