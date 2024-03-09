import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/datasources/gallery_cards_datasource.dart';
import 'gallery_grid_events.dart';
import 'gallery_grid_states.dart';

/// O Bloc do grid deve vir para cá.

/// Responde com a lista de filhotes.
/// Avisos e Erros

class GalleryGridBloc extends Bloc<int, GalleryGridState> {
  final GalleryCardsDatasource datasource;

  GalleryGridBloc(super.initialState, {required this.datasource}) {
    on<int>(fetch);
  }

  /// Encontra a quantidade de filhotes solicitada.
  Future<void> fetch(
    int pageNumber,
    Emitter<GalleryGridState> emit,
  ) async {
    if (pageNumber < 1) return;
    var (info, err) = await datasource.getEntities(21, pageNumber);
    emit(GalleryGridUpdateCards(List.empty()));

    emit(const GalleryGridUpdatePendingProgressIndicators(3));
    emit(GalleryGridInformError(
      404,
      message: 'Not Found',
      extras: null,
    ));
  }
}

// Eventos --ADICIONADO--> Bloc (fetch) -> State
