class SummaryPdf {
    String? api_info;
    String? message;
    String? status;

    SummaryPdf({this.api_info, this.message, this.status});

    factory SummaryPdf.fromJson(Map<String, dynamic> json) {
        return SummaryPdf(
            api_info: json['api_info'], 
            message: json['message'], 
            status: json['status'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['api_info'] = this.api_info;
        data['message'] = this.message;
        data['status'] = this.status;
        return data;
    }
}