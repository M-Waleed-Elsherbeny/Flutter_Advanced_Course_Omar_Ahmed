class DoctorSpecializationDataModel {
  List<Data> data;

  DoctorSpecializationDataModel({
    required this.data,
  });

  factory DoctorSpecializationDataModel.fromJson(Map<String, dynamic> json) =>
      DoctorSpecializationDataModel(
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
      );
}

class Data {
  int id;
  String name;
  List<Doctor> doctors;

  Data({
    required this.id,
    required this.name,
    required this.doctors,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        doctors:
            List<Doctor>.from(json["doctors"].map((x) => Doctor.fromJson(x))),
      );
}

class Doctor {
  int id;
  String name;
  String email;
  String phone;
  String photo;
  String gender;
  String address;
  String description;
  String degree;
  Specialization specialization;
  City city;
  int appointPrice;
  String startTime;
  String endTime;

  Doctor({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.photo,
    required this.gender,
    required this.address,
    required this.description,
    required this.degree,
    required this.specialization,
    required this.city,
    required this.appointPrice,
    required this.startTime,
    required this.endTime,
  });
  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        photo: json["photo"],
        gender: json["gender"],
        address: json["address"],
        description: json["description"],
        degree: json["degree"],
        specialization: Specialization.fromJson(json["specialization"]),
        city: City.fromJson(json["city"]),
        appointPrice: json["appoint_price"],
        startTime: json["start_time"],
        endTime: json["end_time"],
      );
}
class City {
  int id;
  String name;
  City({
    required this.id,
    required this.name,
  });
  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
      );

}

class Specialization {
  int id;
  String name;

  Specialization({
    required this.id,
    required this.name,
  });

  factory Specialization.fromJson(Map<String, dynamic> json) => Specialization(
        id: json["id"],
        name: json["name"],
      );
}
