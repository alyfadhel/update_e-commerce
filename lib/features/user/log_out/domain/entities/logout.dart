import 'package:equatable/equatable.dart';

class LogOut extends Equatable {
  final bool? status;
  final String? message;
  final LogOutData? data;

  const LogOut({
    required this.status,
    required this.message,
    required this.data,
  });

  @override
  List<Object?> get props => [
        status,
        message,
        data,
      ];
}

class LogOutData extends Equatable {
  final int? id;
  final String? token;

  const LogOutData({
    required this.id,
    required this.token,
  });

  @override
  List<Object?> get props => [
    id,
    token,
  ];
}
