import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/src/modules/gallery/data/datasources/gallery_cards_datasource.dart';
import '../../domain/gallery_card_entity.dart';

class FetchGalleryCards {
  // final int pageNumber;

  // FetchGalleryCards({required this.pageNumber});
}

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

class GalleryPageBloc extends Bloc<FetchGalleryCards, GalleryPageState> {
  int pageNumber = 0;

  final GalleryCardsDatasource datasource;

  GalleryPageBloc(super.initialState, {required this.datasource}) {
    on<FetchGalleryCards>(fetch);
  }

  FutureOr<void> fetch(
    FetchGalleryCards event,
    Emitter<GalleryPageState> emit,
  ) async {
    ++pageNumber;
    // emit(GalleryPageLoadingState());

    var (li, err) = await datasource.getEntities(pageNumber);
    if (err != null) {
      
      return emit(GalleryPageFailureState(
        message: err.messsage,
        code: err.code,
      ));
    }
    if (pageNumber <= 1) {
      emit(GalleryPageSuccessState());
    }
    emit(UpdateGalleryPageSuccessState(li));
  }
}
