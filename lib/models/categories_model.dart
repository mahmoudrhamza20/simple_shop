
class CategoriesModel {
  bool? status;
  dynamic message;
  CategoriesDataModel? data;

  CategoriesModel({this.status, this.message, this.data});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ?  CategoriesDataModel.fromJson(json['data']) : null;
  }


}

class CategoriesDataModel {
  int? currentPage;
  List<DataModel>? data;

  CategoriesDataModel(
      {this.currentPage, this.data,});

  CategoriesDataModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <DataModel>[];
      json['data'].forEach((v) {
        data!.add( DataModel.fromJson(v));
      });
    }
  }

}

class DataModel {
  int? id;
  String? name;
  String? image;

  DataModel({this.id, this.name, this.image});

  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

}