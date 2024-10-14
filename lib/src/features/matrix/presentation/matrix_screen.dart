import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matrix_app/src/localization/string_hardcoded.dart';

import '../providers/matrix_provider.dart';

class MatrixScreen extends ConsumerWidget {
  const MatrixScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final matrix = ref.watch(matrixDelosiControllerProvider);
    return Scaffold(
      appBar:
          AppBar(title: Text('Ingresar y Rotar Matriz Antihoraria'.hardcoded)),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              initialValue: matrix.toString(),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'Ingrese matriz como [[1,2],[3,4]]'.hardcoded,
                suffixIcon: IconButton(
                  tooltip: 'Rotar Matriz Antihoraria'.hardcoded,
                  icon: const Icon(Icons.rotate_90_degrees_ccw_outlined),
                  onPressed: () {
                    ref
                        .read(matrixDelosiControllerProvider.notifier)
                        .rotateMatrixAnticlockwise();
                  },
                ),
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null,
              onChanged: (value) {
                ref
                    .read(matrixDelosiControllerProvider.notifier)
                    .setMatrixWithDebounce(value);
              },
            ),
          ),
          if (matrix.isNotEmpty)
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: matrix.first.length,
                ),
                itemCount: matrix.length * matrix.length,
                itemBuilder: (BuildContext context, int index) {
                  /// Calcula el índice de la columna del elemento actual basándose en el índice lineal.
                  /// Usa el operador de módulo para obtener el residuo de la división del índice por el número de columnas,
                  /// lo cual da la posición en la columna para el elemento actual.
                  int x = index % matrix.length;

                  /// Calcula el índice de la fila.
                  /// Usa la división entera para obtener el cociente de la división del índice por el número de columnas,
                  /// lo cual da la posición en la fila para el elemento actual.
                  int y = index ~/ matrix.length;
                  return GridTile(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: Center(
                        /// muestra el valor de la matriz en la posición (y, x)
                        child: Text(
                          matrix[y][x].toString(),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
