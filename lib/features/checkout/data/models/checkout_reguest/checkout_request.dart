class CheckoutParams {
  String? name;
  int? govId;
  String? phone;
  String? address;
  String? email;
  CheckoutParams(this.name, this.govId, this.phone, this.address, this.email);

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "governorate_id": govId,
      "phone": phone,
      "address": address,
      "email": email,
    };
  }
}
