class MomoResultModel {
  late String partnerCode;
  late String orderId;
  late String requestId;
  late String resultCode;
  late String message;
  late String responseTime;
  late String extraData;
  late String signature;

  MomoResultModel(
      this.partnerCode,
      this.orderId,
      this.requestId,
      this.resultCode,
      this.message,
      this.responseTime,
      this.extraData,
      this.signature);

  MomoResultModel.empty(){
    partnerCode = "";
    orderId = "";
    requestId = "";
    resultCode = "";
    message = "";
    responseTime = "";
    extraData = "";
    signature = "";
  }



}
