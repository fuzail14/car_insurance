enum Status { completed, loading, error }

class ApiResponse<TData> {
  TData? data;
  Status? status;
  String? message;

  ApiResponse(this.data, this.status, this.message);
  ApiResponse.loading() : status = Status.loading;
  ApiResponse.completed(this.data) : status = Status.completed;
  ApiResponse.error(this.message) : status = Status.error;

  @override
  String toString() {
    return "Data $data \n Message $message \n Status $status";
  }
}
