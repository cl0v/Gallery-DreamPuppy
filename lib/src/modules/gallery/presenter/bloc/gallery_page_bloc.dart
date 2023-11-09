import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/src/http/client.dart';
import 'package:gallery/src/modules/gallery/data/datasources/pet_cards_datasource.dart';
import 'package:gallery/src/modules/gallery/infra/repositories/gallery_repository.dart';

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

  GalleryPageBloc() : super(GalleryPageLoadingState()) {
    on<FetchGalleryCards>(fetch);
  }

  FutureOr<void> fetch(
      FetchGalleryCards event, Emitter<GalleryPageState> emit) async {
    final repo = GalleryRepositoryImpl(
      datasource: PetCardsDatasourceImpl(http: DefaultHttpConsumer()),
    );

    var c = await repo.fetchCards(event.amount);
    cards.addAll(c);
    print(cards.length);
    
    emit(GalleryPageSuccessState(cards));
  }
}
