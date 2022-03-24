class InstituteType {

    int id;
    String name;

    InstituteType({required this.id, required this.name});

    factory InstituteType.fromJson(Map<String, dynamic> json) {
        return InstituteType(
            //created_at: json['created_at'] != null ? Object.fromJson(json['created_at']) : null,
            id: json['id'], 
            name: json['name'], 
           // updated_at: json['updated_at'] != null ? Object.fromJson(json['updated_at']) : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['name'] = this.name;
        return data;
    }
}