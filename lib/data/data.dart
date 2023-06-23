import 'package:flutter/material.dart';



// late List<Map<String, dynamic>> jobs = [];

// void fetchDataFromRapidAPI() async {
//   final url =
//       'https://jsearch.p.rapidapi.com/search?query=Python%20developer%20in%20Texas%2C%20USA&page=1&num_pages=1';
//   final headers = {
//     'Content-Type': 'application/json',
//     'X-Rapidapi-Key': 'aa9fe9fa58msh53c01e7eb8c954ap12c810jsn1571c226b0f4',
//     'X-Rapidapi-Host': 'jsearch.p.rapidapi.com',
//   };

//   final response = await http.get(Uri.parse(url), headers: headers);

//   if (response.statusCode == 200) {
//     final responseBody = response.body;
//     jobs = parseJobs(responseBody);
//   } else {
//     print('Request failed with status: ${response.statusCode}');
//   }
// }

// List<Map<String, dynamic>> parseJobs(String responseBody) {
//   final parsedData = json.decode(responseBody);

//   // Extract the necessary information from the parsed data
//   final jobsList = parsedData['data'] as List<dynamic>;

//   // Create a list of job maps with the required information
//   final jobs = jobsList.map((job) {
//     return {
//       'companyLogo': job['employer_logo'],
//       'jobTitle': job['job_title'],
//       'type': job['job_employment_type'],
//       'salary': job['job_salary_currency'],
//       'companyName': job['employer_name'],
//       'location': job['job_city'],
//       'countryLocation': job['job_country'],
//       'jobLink': job['job_apply_link'],
//       'postDate': job['job_posted_datetime_utc'],
//       'expiry': job['job_offer_expiration_datetime_utc'],
//     };
//   }).toList();

//   return jobs;
// }

List<Map<String, dynamic>> jobs = [
  {
    "id": 1,
    "companyLogo": "img/Google.png",
    "jobTitle": "Software Engineer",
    "companyName": "Google",
    "salary": "\$100,000",
    "location": "Mountain View, CA",
    "type": "Full Time",
    "status": "Submitted",
  },
  {
    "id": 2,
    "companyLogo": "img/Google.png",
    "jobTitle": "Data Scientist",
    "companyName": "Facebook",
    "salary": "\$150,000",
    "location": "Menlo Park, CA",
    "type": "Full Time",
    "status": "Pending",
  },
  {
    "id": 3,
    "companyLogo": "img/Google.png",
    "jobTitle": "Product Manager",
    "companyName": "Amazon",
    "salary": "\$120,000",
    "location": "Seattle, WA",
    "type": "Full Time",
    "status": "Rejected",
  },
  {
    "id": 4,
    "companyLogo": "img/Google.png",
    "jobTitle": "Cloud Architect",
    "companyName": "Microsoft",
    "salary": "\$130,000",
    "location": "Redmond, WA",
    "type": "Full Time",
    "status": "Delivered",
  },
  {
    "id": 5,
    "companyLogo": "img/Google.png",
    "jobTitle": "UI/UX Designer",
    "companyName": "Apple",
    "salary": "\$110,000",
    "location": "Cupertino, CA",
    "type": "Full Time",
    "status": "Submitted",
  },
  {
    "id": 6,
    "companyLogo": "img/Google.png",
    "jobTitle": "Engineer",
    "companyName": "Tesla",
    "salary": "\$140,000",
    "location": "Palo Alto, CA",
    "type": "Full Time",
    "status": "Reviewing",
  },
  {
    "id": 7,
    "companyLogo": "img/Google.png",
    "jobTitle": "Driver",
    "companyName": "Uber",
    "salary": "\$50,000",
    "location": "San Francisco, CA",
    "type": "Part Time",
    "status": "Pending",
  },
  {
    "id": 8,
    "companyLogo": "img/Google.png",
    "jobTitle": "Driver",
    "companyName": "Lyft",
    "salary": "\$50,000",
    "location": "Los Angeles, CA",
    "type": "Part Time",
    "status": "Delivered",
  },
  {
    "id": 9,
    "companyLogo": "img/Google.png",
    "jobTitle": "Delivery Driver",
    "companyName": "DoorDash",
    "salary": "\$40,000",
    "location": "San Francisco, CA",
    "type": "Part Time",
    "status": "Submitted",
  },
  {
    "id": 10,
    "companyLogo": "img/Google.png",
    "jobTitle": "Personal Shopper",
    "companyName": "Instacart",
    "salary": "\$35,000",
    "location": "San Francisco, CA",
    "type": "Part Time",
    "status": "Reviewing",
  },
  {
    "id": 11,
    "companyLogo": "img/Google.png",
    "jobTitle": "Warehouse Associate",
    "companyName": "Amazon",
    "salary": "\$30,000",
    "location": "Redmond, WA",
    "type": "Full Time",
    "status": "Delivered",
  },
  {
    "id": 12,
    "companyLogo": "img/Google.png",
    "jobTitle": "Cashier",
    "companyName": "Target",
    "salary": "\$25,000",
    "location": "Minneapolis, MN",
    "type": "Part Time",
    "status": "Submitted",
  },
  {
    "id": 13,
    "companyLogo": "img/Google.png",
    "jobTitle": "Stocker",
    "companyName": "Walmart",
    "salary": "\$20,000",
    "location": "Bentonville, AR",
    "type": "Part Time",
    "status": "Pending",
  },
];
