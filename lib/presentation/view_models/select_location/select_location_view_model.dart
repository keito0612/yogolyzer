import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'select_location_view_model.freezed.dart';

/// 場所の選択肢
enum LocationType {
  kitchen('キッチン', '🍳'),
  bathroom('浴室', '🛁'),
  toilet('トイレ', '🚽'),
  livingRoom('リビング', '🛋️'),
  bedroom('寝室', '🛏️'),
  entrance('玄関', '🚪'),
  balcony('ベランダ', '🏠'),
  other('その他', '✏️');

  const LocationType(this.label, this.emoji);

  final String label;
  final String emoji;
}

/// 場所選択画面の状態
@freezed
sealed class SelectLocationState with _$SelectLocationState {
  const factory SelectLocationState({
    /// 撮影した画像のパス
    required String imagePath,

    /// 選択された場所のインデックス（-1で未選択）
    @Default(-1) int selectedIndex,

    /// 「その他」の場合の入力テキスト
    @Default('') String customLocationText,

    /// 次の画面に進む準備ができているか
    @Default(false) bool isReadyToNext,
  }) = _SelectLocationState;
}

/// 場所選択画面のViewModel
class SelectLocationViewModel extends Notifier<SelectLocationState> {
  @override
  SelectLocationState build() {
    return const SelectLocationState(imagePath: '');
  }

  /// 画像パスを設定
  void setImagePath(String path) {
    state = state.copyWith(imagePath: path);
  }

  /// 場所を選択
  void selectLocation(int index) {
    final isOther = index == LocationType.other.index;

    state = state.copyWith(
      selectedIndex: index,
      // その他以外を選択した場合はカスタムテキストをクリア
      customLocationText: isOther ? state.customLocationText : '',
      // その他の場合はテキスト入力があるまで進めない
      isReadyToNext: !isOther || state.customLocationText.isNotEmpty,
    );
  }

  /// 「その他」のテキストを設定
  void setCustomLocationText(String text) {
    state = state.copyWith(
      customLocationText: text,
      isReadyToNext: text.isNotEmpty,
    );
  }

  /// 選択された場所名を取得
  String? get selectedLocationName {
    if (state.selectedIndex < 0) return null;

    final locationType = LocationType.values[state.selectedIndex];
    if (locationType == LocationType.other) {
      return state.customLocationText.isNotEmpty
          ? state.customLocationText
          : null;
    }
    return locationType.label;
  }

  /// 選択された場所タイプを取得
  LocationType? get selectedLocationType {
    if (state.selectedIndex < 0) return null;
    return LocationType.values[state.selectedIndex];
  }
}

/// SelectLocationViewModelのプロバイダー
final selectLocationViewModelProvider =
    NotifierProvider<SelectLocationViewModel, SelectLocationState>(
  SelectLocationViewModel.new,
);
