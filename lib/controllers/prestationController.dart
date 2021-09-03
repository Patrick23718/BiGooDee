import 'package:bigoodee/models/Prestation.dart';
import 'package:bigoodee/services/prestationService.dart';
import 'package:get/state_manager.dart';
import 'package:bigoodee/services/remote_services.dart';

class PrestationController extends GetxController {
  var isLoading = true.obs;
  var prestationList = <Prestation>[].obs;

  @override
  void onInit() {
    fetchPrestations();
    super.onInit();
  }

  void fetchPrestations() async {
    try {
      isLoading(true);
      var prestations = await PrestationServices.fetchPrestations();
      if (prestations != null) {
        prestationList.value = prestations;
      }
    } finally {
      // TODO
      isLoading(false);
    }
  }
}
