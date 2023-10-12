class ConvertModel {
  String? status;
  String? message;
  List<Data>? data;

  ConvertModel({this.status, this.message, this.data});

  ConvertModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? idObt;
  String? trangThai;
  String? tenPlt;
  int? slXuat;
  String? khoiLuong;
  String? maSanPham;

  Data(
      {this.id,
        this.idObt,
        this.trangThai,
        this.tenPlt,
        this.slXuat,
        this.khoiLuong,
        this.maSanPham});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idObt = json['id_obt'];
    trangThai = json['trang_thai'];
    tenPlt = json['ten_plt'];
    slXuat = json['sl_xuat'];
    khoiLuong = json['khoi_luong'];
    maSanPham = json['ma_san_pham'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_obt'] = this.idObt;
    data['trang_thai'] = this.trangThai;
    data['ten_plt'] = this.tenPlt;
    data['sl_xuat'] = this.slXuat;
    data['khoi_luong'] = this.khoiLuong;
    data['ma_san_pham'] = this.maSanPham;
    return data;
  }
}
