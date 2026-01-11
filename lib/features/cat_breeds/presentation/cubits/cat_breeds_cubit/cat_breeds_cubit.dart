// ignore_for_file: avoid_catches_without_on_clauses

import 'package:cat_breeds/lib.dart';
import 'package:cat_breeds_core/cat_breeds_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cat_breeds_cubit.freezed.dart';
part 'cat_breeds_state.dart';

class CatBreedsCubit extends Cubit<CatBreedsState> {
  CatBreedsCubit(this._getCatBreeds) : super(const CatBreedsState.initial());

  final GetCatBreeds _getCatBreeds;

  List<CatBreed> _allBreeds = [];

  Future<void> fetchBreeds() async {
    emit(const CatBreedsState.loading());
    final response = await _getCatBreeds();
    try {
      _allBreeds = response;
      emit(CatBreedsState.success(breeds: response));
    } catch (e) {
      emit(
        CatBreedsState.error(
          failure: HttpRequestFailure.unhandledException(error: e),
        ),
      );
    }
  }

  void filterBreeds(String query) {
    final currentState = state;
    if (currentState is _Success) {
      if (query.isEmpty) {
        emit(CatBreedsState.success(breeds: _allBreeds));
      } else {
        final filtered = _allBreeds
            .where((b) => b.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
        emit(CatBreedsState.success(breeds: filtered));
      }
    }
  }
}
