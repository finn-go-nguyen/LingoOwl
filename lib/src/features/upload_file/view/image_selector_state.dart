import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_selector_state.freezed.dart';

@freezed
class ImageSelectorState with _$ImageSelectorState {
  const ImageSelectorState._();
  const factory ImageSelectorState({
    @Default(false) bool isUploadStarted,
    @Default(false) bool isUploadCompleted,
    @Default(AsyncData(null)) AsyncValue<void> status,
    @Default(0.0) double progress,
    String? downloadUrl,
  }) = _ImageSelectorState;

  bool get isUploadInProgress => isUploadStarted && !isUploadCompleted;
}
