import 'package:community_app/Controllers/filterController.dart';
import 'package:community_app/Models/communityAdListModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CommunityAdListController extends GetxController{
  RxList<CommunityAdListModel> allCommunityList = List<CommunityAdListModel>().obs;

  RxList<CommunityAdListModel> filteredCommunityList = List<CommunityAdListModel>().obs;

  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  FilterController _filterController = Get.find();
  fetchDataWithFilter() async {
    filteredCommunityList.clear();
    await _firebaseFirestore
        .collection('Community')
        .where('category', isEqualTo: _filterController.category.value)
        .where('subCategory', isEqualTo: _filterController.subCategory.value)
        .where('price', isLessThanOrEqualTo: _filterController.price.value)
        .where('isAdPromoted',
        isEqualTo: _filterController.showPromotedAdOnly.value)
        .where('offerType', isEqualTo: _filterController.offerType.value)
        .where('adLanguage', isEqualTo: _filterController.adLanguage.value)
        .where('containPhotos',
        isEqualTo: _filterController.showPhotosOnlyAd.value)
        .get()
        .then((value) {
      value.docs.asMap().forEach((i, element) {
        filteredCommunityList.add(CommunityAdListModel(
            element['adLanguage'],
            element['category'],
            element['description'],
            element['isAdPromoted'],
            element['keyword'],
            element['offerType'],
            element['postedOn'],
            element['price'],
            element['subCategory'],
            element['title'],
            element['location']));
        print(filteredCommunityList[i].AdLanguage);
        print(filteredCommunityList[i].Category);
        print(filteredCommunityList[i].Description);
        print(filteredCommunityList[i].IsAdPromoted);
        print(filteredCommunityList[i].PostedOn);
        print(filteredCommunityList[i].Price);
        print(filteredCommunityList[i].Title);
      });
    });
  }
    fetchDataWithoutFilter() async {
      allCommunityList.clear();
      await _firebaseFirestore.collection('Services').get().then((value) {
        value.docs.asMap().forEach((i, element) {
          allCommunityList.add(CommunityAdListModel(
              element['adLanguage'],
              element['category'],
              element['description'],
              element['isAdPromoted'],
              element['keyword'],
              element['offerType'],
              element['postedOn'],
              element['price'],
              element['subCategory'],
              element['title'],
              element['location']));
        });
      });
    }
}