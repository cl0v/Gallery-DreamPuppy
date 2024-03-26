import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/src/modules/gallery/domain/coordinates.dart';

import '../../../data/datasources/gallery_cards_datasource.dart';
import '../../../domain/gallery_card_entity.dart';
import 'gallery_grid_events.dart';
import 'gallery_grid_states.dart';

/// O Bloc do grid deve vir para cá.

/// Responde com a lista de filhotes.
/// Avisos e Erros

const int initialFetchAmount = 24; // [link] Precisam ser multiplos inteiros
const int subsequentFetchesAmount = 6; // [link] Precisam ser multiplos inteiros
const int pageLimitReached = 14;

class GalleryGridBloc extends Bloc<GalleryGridEvent, GalleryGridState> {
  final GalleryCardsDatasource datasource;

  GeoCoordinates? _coordinates;

  GalleryGridBloc(super.initialState, {required this.datasource}) {
    on<FillGalleryGridEvent>(fillFirstPage);
    on<RequestNewPageGalleryGridEvent>(requestPage);
  }

  int pageNumber = 5;
  List<GalleryCardEntity> cards = [];

  /// Encontra a quantidade de filhotes solicitada.
  Future<void> fillFirstPage(
    FillGalleryGridEvent event,
    Emitter<GalleryGridState> emit,
  ) async {
    _coordinates = event.coordinates;
    var (info, err) = await datasource.getEntities(
      initialFetchAmount,
      1,
      _coordinates,
    );

    if (err != null) {
      event.onError(err);
      emit(
        GalleryGridInformError(
          err.code,
          message: err.message,
        ),
      );
    }
    if (info == null) {
    } else if (info.cards.isEmpty) {
      return;
    } else {
      cards.addAll(info.cards);
      event.onFinish.call();
      emit(GalleryGridUpdateCards(cards));
    }
  }

  // Future<void>

  FutureOr<void> requestPage(RequestNewPageGalleryGridEvent event,
      Emitter<GalleryGridState> emit) async {
    // Limite invisivel TODO: FIX
    if (pageNumber >= pageLimitReached) {
      debugPrint('Acabaram os filhotes!');
      return;
    }
    emit(const GalleryGridUpdatePendingProgressIndicators(3));
    var (info, err) = await datasource.getEntities(
      subsequentFetchesAmount,
      pageNumber,
      _coordinates,
    );
    if (err != null) {
      emit(GalleryGridInformWarning(err.code, message: err.message));
      return;
    }

    if (info == null) {
    } else if (info.cards.isEmpty) {
      emit(GalleryGridInformWarning(111, message: 'Acabaram os filhotes!'));
      return;
    } else {
      if (info.cards.length == subsequentFetchesAmount) {
        pageNumber++;
      } else {
        // Significa que atingiu o numero máximo de carregamentos e vai barrar logo no primeiro if
        pageNumber = pageLimitReached;
      }
      cards.addAll(info.cards);
      emit(GalleryGridUpdateCards(cards));
    }
  }
}

// Eventos --ADICIONADO--> Bloc (fetch) -> State
