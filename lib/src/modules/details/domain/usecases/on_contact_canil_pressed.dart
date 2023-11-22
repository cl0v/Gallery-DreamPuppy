import 'package:gallery/src/modules/auth/auth_module.dart';
import 'package:gallery/src/modules/auth/auth_routes.dart';

import '../entities/user_info.dart';
part '_first_time_id.dart';
part '_is_auth_required.dart';
part '_show_review_popup.dart';

const String detailsPageTitle = 'Detalhes';

class OnGetContactPressedUsecase {
  // ShowReviewerPopUpUsecase showReview = ShowReviewerPopUpUsecase();

  OnGetContactPressedUsecase();

  ({String name, Map<String, String> params, Map<String, dynamic> query}) call(int idCanil) {
    var name = '';
    var queryParams = <String, dynamic>{};
    var pathParams = <String, String>{};

    queryParams.addEntries(const [
      MapEntry('fromTitle', detailsPageTitle),
    ]);

    if (IsAuthRequiredUsecase().call()) {
      name = AuthRouter.instance.names.first;
      pathParams.addEntries(const [
        MapEntry('redirect', 'true'),
      ]);
    } else {
      // entries.add(MapEntry('review', showReview.call().value));

      name = 'canil';
    }

    return (name: name, params: pathParams, query: queryParams);
  }
}
