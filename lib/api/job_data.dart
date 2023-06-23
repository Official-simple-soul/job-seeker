import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Album>> fetchAlbum() async {
  final url =
      'https://jsearch.p.rapidapi.com/search?query=Python%20developer%20in%20Texas%2C%20USA&page=1&num_pages=1';
  final headers = {
    'Content-Type': 'application/json',
    'X-Rapidapi-Key': 'aa9fe9fa58msh53c01e7eb8c954ap12c810jsn1571c226b0f4',
    'X-Rapidapi-Host': 'jsearch.p.rapidapi.com',
  };
  final response = await http.get(Uri.parse(url), headers: headers);

  // final response = await http
  //     .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));

  if (response.statusCode == 200) {
    final dynamic jsonResponse = jsonDecode(response.body);
    final List<dynamic> data = jsonResponse['data'];
    return data.map((job) => Album.fromJson(job)).toList();
  } else {
    print('Request failed with status: ${response.statusCode}');
    throw Exception('Failed');
  }
}

class Album {
  final String jobId;
  final String companyName;
  final String companyLogo;
  final String jobTitle;
  final String jobType;
  final String salary;
  final String location;
  final String jobLink;
  final String countryLocation;
  final String postDate;
  final String expiry;
  // final int userId;
  // final int id;
  // final String title;

  const Album({
    required this.companyLogo,
    required this.companyName,
    required this.jobId,
    required this.jobTitle,
    required this.jobType,
    required this.jobLink,
    required this.salary,
    required this.location,
    required this.postDate,
    required this.countryLocation,
    required this.expiry,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      companyLogo: json['employer_logo'] ?? 'https://cdn-icons-png.flaticon.com/512/52/52782.png',
      jobTitle: json['job_title'] ?? '',
      jobId: json['job_id'] ?? '',
      jobType: json['job_employment_type'] ?? '',
      salary: json['job_salary_currency'] ?? '-',
      companyName: json['employer_name'] ?? '',
      location: json['job_city'] ?? '',
      countryLocation: json['job_country'] ?? '',
      jobLink: json['job_apply_link'] ?? '',
      postDate: json['job_posted_datetime_utc'] ?? '',
      expiry: json['job_offer_expiration_datetime_utc'] ?? '',
    );
  }
}
