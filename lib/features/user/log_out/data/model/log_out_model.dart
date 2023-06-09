
import 'package:review_shop_app/features/user/log_out/domain/entities/logout.dart';

class LogOutModel extends LogOut {
  const LogOutModel({
    required super.status,
    required super.message,
    required super.data,
  });

  factory LogOutModel.fromJson(Map<String, dynamic> json) {
    return LogOutModel(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? LogOutDataModel.fromJson(json['data']) : null,
    );
  }
}

class LogOutDataModel extends LogOutData {
  const LogOutDataModel({
    required super.id,
    required super.token,
  });

  factory LogOutDataModel.fromJson(Map<String, dynamic> json) {
    return LogOutDataModel(
      id: json['id'],
      token: json['token'],
    );
  }
}
