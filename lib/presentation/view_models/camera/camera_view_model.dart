import 'package:camera/camera.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'camera_view_model.freezed.dart';

/// カメラ画面の状態
@freezed
sealed class CameraState with _$CameraState {
  /// 初期化中
  const factory CameraState.initializing() = CameraStateInitializing;

  /// カメラ準備完了
  const factory CameraState.ready({
    required CameraController controller,
    @Default(false) bool isFlashOn,
  }) = CameraStateReady;

  /// 撮影完了
  const factory CameraState.captured({
    required String imagePath,
  }) = CameraStateCaptured;

  /// エラー
  const factory CameraState.error({
    required String message,
  }) = CameraStateError;
}

/// カメラ画面のViewModel
class CameraViewModel extends Notifier<CameraState> {
  CameraController? _controller;

  @override
  CameraState build() {
    // Disposeでカメラを解放
    ref.onDispose(() {
      _controller?.dispose();
    });

    // 初期化開始
    _initializeCamera();

    return const CameraState.initializing();
  }

  /// カメラを初期化
  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isEmpty) {
        state = const CameraState.error(message: 'カメラが見つかりません');
        return;
      }

      // バックカメラを優先
      final camera = cameras.firstWhere(
        (c) => c.lensDirection == CameraLensDirection.back,
        orElse: () => cameras.first,
      );

      _controller = CameraController(
        camera,
        ResolutionPreset.high,
        enableAudio: false,
      );

      await _controller!.initialize();

      state = CameraState.ready(controller: _controller!);
    } catch (e) {
      state = CameraState.error(message: 'カメラの初期化に失敗しました: $e');
    }
  }

  /// フラッシュモードを切り替え
  Future<void> toggleFlash() async {
    final currentState = state;
    if (currentState is! CameraStateReady) return;

    final newFlashOn = !currentState.isFlashOn;
    final flashMode = newFlashOn ? FlashMode.torch : FlashMode.off;

    await _controller?.setFlashMode(flashMode);
    state = currentState.copyWith(isFlashOn: newFlashOn);
  }

  /// 写真を撮影
  Future<void> takePicture() async {
    if (state is! CameraStateReady) return;

    try {
      // フラッシュをオフに
      await _controller?.setFlashMode(FlashMode.off);

      final image = await _controller?.takePicture();
      if (image != null) {
        state = CameraState.captured(imagePath: image.path);
      }
    } catch (e) {
      state = CameraState.error(message: '撮影に失敗しました: $e');
    }
  }

  /// ギャラリーから選択
  Future<void> pickFromGallery() async {
    try {
      final picker = ImagePicker();
      final image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        state = CameraState.captured(imagePath: image.path);
      }
    } catch (e) {
      state = CameraState.error(message: 'ギャラリーからの選択に失敗しました: $e');
    }
  }

  /// 再撮影（カメラを再初期化）
  Future<void> retake() async {
    state = const CameraState.initializing();
    await _initializeCamera();
  }
}

/// CameraViewModelプロバイダー
final cameraViewModelProvider =
    NotifierProvider.autoDispose<CameraViewModel, CameraState>(
  CameraViewModel.new,
);
