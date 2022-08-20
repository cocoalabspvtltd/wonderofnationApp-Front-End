class InvoiceModelClass {
    int? amount;
    String? email;
    String? name;
    String? payment_id;

    InvoiceModelClass({this.amount, this.email, this.name, this.payment_id});

    factory InvoiceModelClass.fromJson(Map<String, dynamic> json) {
        return InvoiceModelClass(
            amount: json['amount'],
            email: json['email'],
            name: json['name'],
            payment_id: json['payment_id'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['amount'] = this.amount;
        data['email'] = this.email;
        data['name'] = this.name;
        data['payment_id'] = this.payment_id;
        return data;
    }
}