import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:matrix_app/src/localization/string_hardcoded.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../toast/custom_toast.dart';

part 'matrix_provider.g.dart';

@riverpod
class DebounceController extends _$DebounceController {
  Timer? _debounce;

  @override
  Timer? build() {
    // No necesita un estado inicial, solo retornamos null
    return null;
  }

  void run(Duration delay, VoidCallback action) {
    // Cancela el Timer anterior si aún está corriendo
    _debounce?.cancel();

    // Inicia un nuevo Timer
    _debounce = Timer(delay, action);
  }
}

@riverpod
class MatrixDelosiController extends _$MatrixDelosiController {
  // Timer? _debounce; // Timer para esperar antes de ejecutar setMatrix
  @override
  List<List<int>> build() {
    // ejemplo inicial
    return [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ];
  }

  void rotateMatrixAnticlockwise() async {
    List<List<int>> oldMatrix =
        List<List<int>>.from(state.map((List<int> row) => List<int>.from(row)));

    int n = state.length;
    List<List<int>> newMatrix = List.generate(n, (_) => List.filled(n, 0));

    /// bucles anidados para rotar la matriz.
    /// El elemento en la posición [i][j] de la matriz original se mueve a la posición [n-j-1][i] en la nueva matriz.
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        newMatrix[n - j - 1][i] = state[i][j];
      }
    }

    await CustomToast.show(
        "Este es el valor anterior de la matriz: $oldMatrix".hardcoded);

    state = newMatrix;
  }

  bool _isValidMatrix(List<List<int>> matrix) {
    final size = matrix.length;
    return matrix.every((row) => row.length == size);
  }

  List<List<int>>? _parseMatrix(String text) {
    try {
      text = text.replaceAll(RegExp(r'\s+'), ''); // Remove any spaces
      final result = text
          .substring(1, text.length - 1) // Remove outer brackets
          .split('],[')
          .map((e) => e
              .replaceAll(RegExp(r'[ \[\]]'), '')
              .split(',')
              .map(int.parse)
              .toList())
          .toList();
      return result;
    } catch (e) {
      debugPrint('Error parsing matrix: $e'.hardcoded);
      return null;
    }
  }

  void setMatrixWithDebounce(String text) {
    ref.read(debounceControllerProvider.notifier).run(
          const Duration(milliseconds: 500),
          () => _setMatrix(text),
        );
  }

  void _setMatrix(String? text) {
    if (text == null || text.isEmpty) {
      CustomToast.show('Ingrese una matriz'.hardcoded);
      return;
    }
    final newMatrix = _parseMatrix(text);
    if (newMatrix != null && _isValidMatrix(newMatrix)) {
      state = newMatrix;
    } else {
      state = [];
      CustomToast.show('Error en el formato o validez de la matriz'.hardcoded);
    }
  }
}
