import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/src/modules/gallery/data/datasources/gallery_cards_datasource.dart';
import '../../domain/gallery_card_entity.dart';

class FetchGalleryCards {
  final int amount;

  FetchGalleryCards({required this.amount});
}

abstract class GalleryPageState {}

class GalleryPageLoadingState implements GalleryPageState {}

class GalleryPageSuccessState implements GalleryPageState {
  final List<GalleryCardEntity> cards;

  GalleryPageSuccessState(this.cards);
}

class GalleryPageFailureState implements GalleryPageState {
  final String message;
  final int code;

  GalleryPageFailureState({
    required this.message,
    required this.code,
  });
}

class GalleryPageBloc extends Bloc<FetchGalleryCards, GalleryPageState> {
  List<GalleryCardEntity> cards = [];

  final GalleryCardsDatasource datasource;

  GalleryPageBloc(super.initialState, {required this.datasource}) {
    on<FetchGalleryCards>(fetch);
  }

  FutureOr<void> fetch(
    FetchGalleryCards event,
    Emitter<GalleryPageState> emit,
  ) async {
    emit(GalleryPageLoadingState());

    var (c, err) = await datasource.fillCards(event.amount);
    if (err != null) {
      return emit(
          GalleryPageFailureState(message: err.messsage, code: err.code));
    }

    cards.addAll(c);
    return emit(GalleryPageSuccessState(cards));
  }
}
