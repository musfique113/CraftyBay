import 'package:CraftyBay/data/models/models_data/carousel_slider_data.dart';

class CarouselSliderDataModel {
  String? msg;
  List<CarouselSliderData>? data;

  CarouselSliderDataModel({this.msg, this.data});

  CarouselSliderDataModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <CarouselSliderData>[];
      json['data'].forEach((v) {
        data!.add(CarouselSliderData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
