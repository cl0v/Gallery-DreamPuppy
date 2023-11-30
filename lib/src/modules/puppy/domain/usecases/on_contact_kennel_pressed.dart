part '_first_time_id.dart';
part '_show_review_popup.dart';

const String detailsPageTitle = 'Detalhes';

class OnGetContactPressedUsecase {
  // ShowReviewerPopUpUsecase showReview = ShowReviewerPopUpUsecase();

  OnGetContactPressedUsecase();

  ({String name, Map<String, String> params, Map<String, dynamic> query}) call(
    int puppyId,
  ) {
    // TODO: Rename to kennel
    var name = 'canil';
    var queryParams = <String, dynamic>{};
    var pathParams = <String, String>{};

    // queryParams.addEntries(const [
    //   MapEntry('fromTitle', detailsPageTitle),
    // ]);

    // if (IsAuthRequiredUsecase().call()) {
    //   name = AuthRouter.instance.names.first;
    //   pathParams.addEntries(const [
    //     MapEntry('redirect', 'true'),
    //   ]);
    // } else {
    // entries.add(MapEntry('review', showReview.call().value));

    return (name: name, params: pathParams, query: queryParams);
  }
}
