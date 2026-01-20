import 'package:milkman/data/response/status.dart';

class ApiResponse<T> {
  String? message;
  T? data;
  Status? status;

  ApiResponse({this.message, this.data, this.status});
  ApiResponse.loading() : status = Status.lOADING;
  ApiResponse.completed(this.data) : status = Status.cOMPLETED;
  ApiResponse.error(this.message) : status = Status.eRROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}
