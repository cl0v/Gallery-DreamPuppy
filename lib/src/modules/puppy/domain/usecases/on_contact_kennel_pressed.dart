import 'package:gallery/src/modules/puppy/data/puppy_datasource.dart';

import '../../puppy_module.dart';

part '_first_time_id.dart';
part '_show_review_popup.dart';

const String detailsPageTitle = 'Detalhes';

class OnGetKennelContactsPressedUsecase {
  // ShowReviewerPopUpUsecase showReview = ShowReviewerPopUpUsecase();

  final PuppyDetailsDatasource datasource =
      puppyIoC.get<PuppyDetailsDatasource>();

  Future<
      ({
        String name,
        Map<String, String> params,
        Map<String, dynamic> query
      })> call(
    int puppyId,
  ) async {
    var name = 'kennel';
    var queryParams = <String, dynamic>{};
    var pathParams = <String, String>{};

    var kennelId = await datasource.getKennelId(puppyId);

    pathParams['id'] = kennelId;

    // queryParams.addEntries(const [z
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
