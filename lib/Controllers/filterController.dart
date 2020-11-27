import 'package:get/get.dart';

class FilterController extends GetxController {
  RxString location = 'Dubai'.obs;
  RxString searchIn = 'Services'.obs;
  RxString category = 'Wedding'.obs;
  RxString subCategory = 'Florists'.obs;
  RxDouble price = 20000.0.obs;
  RxString adLanguage = 'English'.obs;
  RxString offerType = 'Any'.obs;
  RxBool showPhotosOnlyAd = true.obs;
  RxBool showPromotedAdOnly = true.obs;

  RxList allLocationsList = ['Dubai', 'UAE', 'City Center'].obs;

  RxList allSearchInList = ['Motors', 'Services', 'Jobs'].obs;

  RxList allCategoryList = [].obs;

  RxList allSubCategoryList = [].obs;

  RxList allLangaugeAvailable = ['English', 'Arabic'].obs;

  RxList allOfferType = ['Want', 'Any'].obs;

}