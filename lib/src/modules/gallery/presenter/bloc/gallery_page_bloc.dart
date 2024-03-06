import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/src/modules/gallery/data/datasources/gallery_cards_datasource.dart';
import '../../domain/gallery_card_entity.dart';

abstract class FetchCardsEvent {}

class GalleryGridFetchCards extends FetchCardsEvent {
  final int page;

  GalleryGridFetchCards({required this.page});
}

class AddOneLineToGalleryGrid extends FetchCardsEvent {}

abstract class GalleryPageState {}

class GalleryPageLoadingState implements GalleryPageState {}

class GalleryPageSuccessState implements GalleryPageState {
  // final List<GalleryCardEntity> cards;

  GalleryPageSuccessState();
}

class UpdateGalleryPageSuccessState implements GalleryPageState {
  final List<GalleryCardEntity> cards;

  UpdateGalleryPageSuccessState(this.cards);
}

class GalleryPageFailureState implements GalleryPageState {
  final String message;
  final int code;

  GalleryPageFailureState({
    required this.message,
    required this.code,
  });
}

//TODO: Adicionar uma mensagem de Alerta para avisar que algo deu errado.
class GalleryToastAlertState implements GalleryPageState {}

class GalleryPageBloc extends Bloc<FetchCardsEvent, GalleryPageState> {
  int lastPageNumber = 0;

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
    lastPageNumber = event.page;

    var (li, err) = await datasource.getEntities(event.page);
    if (err != null) {
      return emit(GalleryPageFailureState(
        message: err.messsage,
        code: err.code,
      ));
    }
    if (event.page <= 1 && li.isEmpty) {
      return;
    }

    emit(UpdateGalleryPageSuccessState(li));
  }

  FutureOr<void> addLine(
    AddOneLineToGalleryGrid event,
    Emitter<GalleryPageState> emit,
  ) async {
    lastPageNumber += 1;
    if(lastPageNumber > 33) return;
    var (li, err) = await datasource.getEntities(lastPageNumber);
    if (err != null) {
      emit(GalleryToastAlertState());
      return;
    }
    emit(UpdateGalleryPageSuccessState(li));
  }
}
