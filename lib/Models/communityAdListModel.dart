import 'package:cloud_firestore/cloud_firestore.dart';

class CommunityAdListModel{
  String AdLanguage;
  String Category;
  String SubCategory;
  String Title;
  String Description;
  bool IsAdPromoted;
  List<dynamic> Keyword;
  String OfferType;
  Timestamp PostedOn;
  int Price;
  String Location;

  CommunityAdListModel(
      this.AdLanguage,
      this.Category,
      this.Description,
      this.IsAdPromoted,
      this.Keyword,
      this.OfferType,
      this.PostedOn,
      this.Price,
      this.SubCategory,
      this.Title,
      this.Location);
}