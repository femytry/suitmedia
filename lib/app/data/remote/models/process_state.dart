class ProcessState {
  Status? status;
  String? message;

  ProcessState();

  ProcessState.status(this.status);

  ProcessState.woData(this.status, this.message);

  static var LOADING = ProcessState.status(Status.RUNNING);
  static var LOADED = ProcessState.status(Status.SUCCESS);

  static ProcessState error(String message) {
    return ProcessState.woData(Status.FAILED, message);
  }
}

enum Status { RUNNING, SUCCESS, FAILED }
