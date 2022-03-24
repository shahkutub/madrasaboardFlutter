class Institute {
    int? district_id;
    int? division_id;
    String? eiin;
    int? id;
    int? institute_type_id;
    String? name;
    int? thana_id;

    Institute({ this.district_id, this.division_id, this.eiin, this.id, this.institute_type_id, this.name, this.thana_id});

    factory Institute.fromJson(Map<String, dynamic> json) {
        return Institute(
            district_id: json['district_id'],
            division_id: json['division_id'], 
            eiin: json['eiin'], 
            id: json['id'], 
            institute_type_id: json['institute_type_id'], 
            name: json['name'], 
            thana_id: json['thana_id']
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['district_id'] = this.district_id;
        data['division_id'] = this.division_id;
        data['eiin'] = this.eiin;
        data['id'] = this.id;
        data['institute_type_id'] = this.institute_type_id;
        data['name'] = this.name;
        data['thana_id'] = this.thana_id;

        return data;
    }
}