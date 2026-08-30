import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/constants/app_colors.dart';
import '../../router/app_routes.dart';
import '../../view_models/camera/camera_view_model.dart';

/// カメラ画面
class CameraPage extends ConsumerWidget {
  const CameraPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(cameraViewModelProvider);
    final viewModel = ref.read(cameraViewModelProvider.notifier);

    // 撮影完了時に場所選択画面へ遷移
    ref.listen<CameraState>(cameraViewModelProvider, (previous, next) {
      next.whenOrNull(
        captured: (imagePath) {
          context.go(AppRoutes.selectLocation, extra: imagePath);
        },
      );
    });

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text('汚れを撮影'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.pop(),
        ),
      ),
      body: state.when(
        initializing: () => _buildLoading(),
        ready: (controller, isFlashOn) => _buildCameraView(
          context,
          controller,
          isFlashOn,
          viewModel,
        ),
        captured: (_) => _buildLoading(), // 遷移中
        error: (message) => _buildError(context, message, viewModel),
      ),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(color: Colors.white),
    );
  }

  Widget _buildError(
    BuildContext context,
    String message,
    CameraViewModel viewModel,
  ) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.white54),
            const SizedBox(height: 16),
            Text(
              message,
              style: const TextStyle(color: Colors.white70),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: viewModel.retake,
              child: const Text('再試行'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCameraView(
    BuildContext context,
    CameraController controller,
    bool isFlashOn,
    CameraViewModel viewModel,
  ) {
    return Column(
      children: [
        // カメラプレビュー
        Expanded(
          flex: 6,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // カメラプレビュー
              SizedBox(
                width: double.infinity,
                child: CameraPreview(controller),
              ),

              // ガイド枠
              _buildGuideFrame(),

              // ヒントテキスト
              Positioned(
                bottom: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    '汚れが枠内に入るように撮影してください',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ),

        // コントロール部分
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.black,
            child: _buildControls(isFlashOn, viewModel),
          ),
        ),
      ],
    );
  }

  Widget _buildGuideFrame() {
    return Container(
      width: 280,
      height: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.6),
          width: 2,
        ),
      ),
    );
  }

  Widget _buildControls(bool isFlashOn, CameraViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // ギャラリーボタン
          _buildControlButton(
            icon: Icons.photo_library_outlined,
            onPressed: viewModel.pickFromGallery,
          ),

          // シャッターボタン
          _buildShutterButton(viewModel),

          // フラッシュボタン
          _buildControlButton(
            icon: isFlashOn ? Icons.flash_on : Icons.flash_off,
            onPressed: viewModel.toggleFlash,
            isActive: isFlashOn,
          ),
        ],
      ),
    );
  }

  Widget _buildControlButton({
    required IconData icon,
    required VoidCallback onPressed,
    bool isActive = false,
  }) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 28,
        color: isActive ? AppColors.warning : Colors.white,
      ),
    );
  }

  Widget _buildShutterButton(CameraViewModel viewModel) {
    return GestureDetector(
      onTap: viewModel.takePicture,
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 4),
        ),
        child: Container(
          margin: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
