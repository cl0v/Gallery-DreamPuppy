import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/src/modules/gallery/data/datasources/gallery_cards_datasource.dart';
import '../../../domain/gallery_card_entity.dart';
import 'gallery_page_states.dart';

abstract class FetchCardsEvent {}

class GalleryGridFetchCards extends FetchCardsEvent {
  final int page;

  GalleryGridFetchCards({required this.page});
}

class AddOneLineToGalleryGrid extends FetchCardsEvent {}

class UpdateGalleryPageSuccessState implements GalleryPageState {
  final List<GalleryCardEntity> cards;

  UpdateGalleryPageSuccessState(this.cards);
}

//TODO: Adicionar uma mensagem de Alerta para avisar que algo deu errado.
class GalleryToastAlertState implements GalleryPageState {}

const int initialFetchAmount = 24;  // [link] Precisam ser multiplos inteiros
const int subsequentFetchesAmount = 6; // [link] Precisam ser multiplos inteiros
const int pageLimitReached = 14;

class GalleryPageBloc extends Bloc<FetchCardsEvent, GalleryPageState> {
  int pageNumber = 4;
  List<GalleryCardEntity> cards = [];

  final GalleryCardsDatasource datasource;

  GalleryPageBloc(super.initialState, {required this.datasource}) {
    on<GalleryGridFetchCards>(fetch);
    on<AddOneLineToGalleryGrid>(addLine);
  }

  FutureOr<void> fetch(
    GalleryGridFetchCards event,
    Emitter<GalleryPageState> emit,
  ) async {
    // emit(GalleryPageLoadingState());
    // lastPageNumber = event.page;
    var (info, err) =
        await datasource.getEntities(initialFetchAmount, event.page);

    if (err != null) {
      emit(GalleryPageFailureState(
        message: err.messsage,
        code: err.code,
      ));
    }
    if (info == null) {
    } else if (info.cards.isEmpty) {
      return;
    } else {
      cards.addAll(info.cards);
      emit(UpdateGalleryPageSuccessState(cards));
    }
  }

  FutureOr<void> addLine(
    AddOneLineToGalleryGrid event,
    Emitter<GalleryPageState> emit,
  ) async {
    // Limite invisivel TODO: FIX
    if (pageNumber >= pageLimitReached) {
      print('[M. fix 242] Max pages reached Error');
      return;
    }
      print('[Called] Max pages reached Error');
    var (info, err) = await datasource.getEntities(
      subsequentFetchesAmount,
      pageNumber,
    );
    if (err != null) {
      emit(GalleryToastAlertState());
      return;
    }

    if (info == null) {
    } else if (info.cards.isEmpty) {
      return;
    } else {
      if (info.cards.length == subsequentFetchesAmount) {
        pageNumber++;
      } else {
        // Significa que atingiu o numero máximo de carregamentos e vai barrar logo no primeiro if
        pageNumber = pageLimitReached;
      }
      cards.addAll(info.cards);
      emit(UpdateGalleryPageSuccessState(cards));
    }
    // lastPageNumber += 1;
    // if (lastPageNumber > 33) return;
    // emit(UpdateGalleryPageSuccessState(li));
  }
}
