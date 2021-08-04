import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Globals {
  // Languages that can be selected
  static List<String> appLanguages = ['English', 'हिंदी', 'বাংলা'];

  // Selected Language
  static String selectedAppLanguage = appLanguages[0];

  // Validation message colour
  static Color validationColor = Color.fromRGBO(250, 74, 91, 1);

  // Check for valid email address
  static bool isEmail(String email) {
    // Null or empty string is invalid
    if (email.isEmpty) {
      return false;
    }

    const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    final regExp = RegExp(pattern);

    if (!regExp.hasMatch(email)) {
      return false;
    }
    return true;
  }

  // Check for valid mobile number
  static bool isValidMobileNumber(String mobileNumber) {
    // Null or empty string is invalid
    if (mobileNumber.isEmpty) {
      return false;
    }
    const pattern = r'^(?:[+0][1-9])?[0-9]{10,12}$';
    final regExp = RegExp(pattern);

    if (!regExp.hasMatch(mobileNumber)) {
      return false;
    }
    return true;
  }

  // Store user related information after login.
  static String userFirstName = '';

  static String userLastName = '';

  static String designation = '';

  // Base url of the APIs

  // Country Codes and ISD Codes List

  static List<Map<String, dynamic>> countryISDCodes = [
    {"name": "Afghanistan", "ISD": "+93", "countryCode": "AF"},
    {"name": "Åland Islands", "ISD": "+358", "countryCode": "AX"},
    {"name": "Albania", "ISD": "+355", "countryCode": "AL"},
    {"name": "Algeria", "ISD": "+213", "countryCode": "DZ"},
    {"name": "American Samoa", "ISD": "+1684", "countryCode": "AS"},
    {"name": "Andorra", "ISD": "+376", "countryCode": "AD"},
    {"name": "Angola", "ISD": "+244", "countryCode": "AO"},
    {"name": "Anguilla", "ISD": "+1264", "countryCode": "AI"},
    {"name": "Antarctica", "ISD": "+672", "countryCode": "AQ"},
    {"name": "Antigua and Barbuda", "ISD": "+1268", "countryCode": "AG"},
    {"name": "Argentina", "ISD": "+54", "countryCode": "AR"},
    {"name": "Armenia", "ISD": "+374", "countryCode": "AM"},
    {"name": "Aruba", "ISD": "+297", "countryCode": "AW"},
    {"name": "Australia", "ISD": "+61", "countryCode": "AU"},
    {"name": "Austria", "ISD": "+43", "countryCode": "AT"},
    {"name": "Azerbaijan", "ISD": "+994", "countryCode": "AZ"},
    {"name": "Bahamas", "ISD": "+1242", "countryCode": "BS"},
    {"name": "Bahrain", "ISD": "+973", "countryCode": "BH"},
    {"name": "Bangladesh", "ISD": "+880", "countryCode": "BD"},
    {"name": "Barbados", "ISD": "+1246", "countryCode": "BB"},
    {"name": "Belarus", "ISD": "+375", "countryCode": "BY"},
    {"name": "Belgium", "ISD": "+32", "countryCode": "BE"},
    {"name": "Belize", "ISD": "+501", "countryCode": "BZ"},
    {"name": "Benin", "ISD": "+229", "countryCode": "BJ"},
    {"name": "Bermuda", "ISD": "+1441", "countryCode": "BM"},
    {"name": "Bhutan", "ISD": "+975", "countryCode": "BT"},
    {
      "name": "Bolivia, Plurinational State of bolivia",
      "ISD": "+591",
      "countryCode": "BO"
    },
    {"name": "Bosnia and Herzegovina", "ISD": "+387", "countryCode": "BA"},
    {"name": "Botswana", "ISD": "+267", "countryCode": "BW"},
    {"name": "Bouvet Island", "ISD": "+47", "countryCode": "BV"},
    {"name": "Brazil", "ISD": "+55", "countryCode": "BR"},
    {
      "name": "British Indian Ocean Territory",
      "ISD": "+246",
      "countryCode": "IO"
    },
    {"name": "Brunei Darussalam", "ISD": "+673", "countryCode": "BN"},
    {"name": "Bulgaria", "ISD": "+359", "countryCode": "BG"},
    {"name": "Burkina Faso", "ISD": "+226", "countryCode": "BF"},
    {"name": "Burundi", "ISD": "+257", "countryCode": "BI"},
    {"name": "Cambodia", "ISD": "+855", "countryCode": "KH"},
    {"name": "Cameroon", "ISD": "+237", "countryCode": "CM"},
    {"name": "Canada", "ISD": "+1", "countryCode": "CA"},
    {"name": "Cape Verde", "ISD": "+238", "countryCode": "CV"},
    {"name": "Cayman Islands", "ISD": "+ 345", "countryCode": "KY"},
    {"name": "Central African Republic", "ISD": "+236", "countryCode": "CF"},
    {"name": "Chad", "ISD": "+235", "countryCode": "TD"},
    {"name": "Chile", "ISD": "+56", "countryCode": "CL"},
    {"name": "China", "ISD": "+86", "countryCode": "CN"},
    {"name": "Christmas Island", "ISD": "+61", "countryCode": "CX"},
    {"name": "Cocos (Keeling) Islands", "ISD": "+61", "countryCode": "CC"},
    {"name": "Colombia", "ISD": "+57", "countryCode": "CO"},
    {"name": "Comoros", "ISD": "+269", "countryCode": "KM"},
    {"name": "Congo", "ISD": "+242", "countryCode": "CG"},
    {
      "name": "Congo, The Democratic Republic of the Congo",
      "ISD": "+243",
      "countryCode": "CD"
    },
    {"name": "Cook Islands", "ISD": "+682", "countryCode": "CK"},
    {"name": "Costa Rica", "ISD": "+506", "countryCode": "CR"},
    {"name": "Cote d'Ivoire", "ISD": "+225", "countryCode": "CI"},
    {"name": "Croatia", "ISD": "+385", "countryCode": "HR"},
    {"name": "Cuba", "ISD": "+53", "countryCode": "CU"},
    {"name": "Cyprus", "ISD": "+357", "countryCode": "CY"},
    {"name": "Czech Republic", "ISD": "+420", "countryCode": "CZ"},
    {"name": "Denmark", "ISD": "+45", "countryCode": "DK"},
    {"name": "Djibouti", "ISD": "+253", "countryCode": "DJ"},
    {"name": "Dominica", "ISD": "+1767", "countryCode": "DM"},
    {"name": "Dominican Republic", "ISD": "+1849", "countryCode": "DO"},
    {"name": "Ecuador", "ISD": "+593", "countryCode": "EC"},
    {"name": "Egypt", "ISD": "+20", "countryCode": "EG"},
    {"name": "El Salvador", "ISD": "+503", "countryCode": "SV"},
    {"name": "Equatorial Guinea", "ISD": "+240", "countryCode": "GQ"},
    {"name": "Eritrea", "ISD": "+291", "countryCode": "ER"},
    {"name": "Estonia", "ISD": "+372", "countryCode": "EE"},
    {"name": "Ethiopia", "ISD": "+251", "countryCode": "ET"},
    {"name": "Falkland Islands (Malvinas)", "ISD": "+500", "countryCode": "FK"},
    {"name": "Faroe Islands", "ISD": "+298", "countryCode": "FO"},
    {"name": "Fiji", "ISD": "+679", "countryCode": "FJ"},
    {"name": "Finland", "ISD": "+358", "countryCode": "FI"},
    {"name": "France", "ISD": "+33", "countryCode": "FR"},
    {"name": "French Guiana", "ISD": "+594", "countryCode": "GF"},
    {"name": "French Polynesia", "ISD": "+689", "countryCode": "PF"},
    {"name": "French Southern Territories", "ISD": "+262", "countryCode": "TF"},
    {"name": "Gabon", "ISD": "+241", "countryCode": "GA"},
    {"name": "Gambia", "ISD": "+220", "countryCode": "GM"},
    {"name": "Georgia", "ISD": "+995", "countryCode": "GE"},
    {"name": "Germany", "ISD": "+49", "countryCode": "DE"},
    {"name": "Ghana", "ISD": "+233", "countryCode": "GH"},
    {"name": "Gibraltar", "ISD": "+350", "countryCode": "GI"},
    {"name": "Greece", "ISD": "+30", "countryCode": "GR"},
    {"name": "Greenland", "ISD": "+299", "countryCode": "GL"},
    {"name": "Grenada", "ISD": "+1473", "countryCode": "GD"},
    {"name": "Guadeloupe", "ISD": "+590", "countryCode": "GP"},
    {"name": "Guam", "ISD": "+1671", "countryCode": "GU"},
    {"name": "Guatemala", "ISD": "+502", "countryCode": "GT"},
    {"name": "Guernsey", "ISD": "+44", "countryCode": "GG"},
    {"name": "Guinea", "ISD": "+224", "countryCode": "GN"},
    {"name": "Guinea-Bissau", "ISD": "+245", "countryCode": "GW"},
    {"name": "Guyana", "ISD": "+592", "countryCode": "GY"},
    {"name": "Haiti", "ISD": "+509", "countryCode": "HT"},
    {
      "name": "Heard Island and Mcdonald Islands",
      "ISD": "+0",
      "countryCode": "HM"
    },
    {
      "name": "Holy See (Vatican City State)",
      "ISD": "+379",
      "countryCode": "VA"
    },
    {"name": "Honduras", "ISD": "+504", "countryCode": "HN"},
    {"name": "Hong Kong", "ISD": "+852", "countryCode": "HK"},
    {"name": "Hungary", "ISD": "+36", "countryCode": "HU"},
    {"name": "Iceland", "ISD": "+354", "countryCode": "IS"},
    {"name": "India", "ISD": "+91", "countryCode": "IN"},
    {"name": "Indonesia", "ISD": "+62", "countryCode": "ID"},
    {
      "name": "Iran, Islamic Republic of Persian Gulf",
      "ISD": "+98",
      "countryCode": "IR"
    },
    {"name": "Iraq", "ISD": "+964", "countryCode": "IQ"},
    {"name": "Ireland", "ISD": "+353", "countryCode": "IE"},
    {"name": "Isle of Man", "ISD": "+44", "countryCode": "IM"},
    {"name": "Israel", "ISD": "+972", "countryCode": "IL"},
    {"name": "Italy", "ISD": "+39", "countryCode": "IT"},
    {"name": "Jamaica", "ISD": "+1876", "countryCode": "JM"},
    {"name": "Japan", "ISD": "+81", "countryCode": "JP"},
    {"name": "Jersey", "ISD": "+44", "countryCode": "JE"},
    {"name": "Jordan", "ISD": "+962", "countryCode": "JO"},
    {"name": "Kazakhstan", "ISD": "+7", "countryCode": "KZ"},
    {"name": "Kenya", "ISD": "+254", "countryCode": "KE"},
    {"name": "Kiribati", "ISD": "+686", "countryCode": "KI"},
    {
      "name": "Korea, Democratic People's Republic of Korea",
      "ISD": "+850",
      "countryCode": "KP"
    },
    {
      "name": "Korea, Republic of South Korea",
      "ISD": "+82",
      "countryCode": "KR"
    },
    {"name": "Kosovo", "ISD": "+383", "countryCode": "XK"},
    {"name": "Kuwait", "ISD": "+965", "countryCode": "KW"},
    {"name": "Kyrgyzstan", "ISD": "+996", "countryCode": "KG"},
    {"name": "Laos", "ISD": "+856", "countryCode": "LA"},
    {"name": "Latvia", "ISD": "+371", "countryCode": "LV"},
    {"name": "Lebanon", "ISD": "+961", "countryCode": "LB"},
    {"name": "Lesotho", "ISD": "+266", "countryCode": "LS"},
    {"name": "Liberia", "ISD": "+231", "countryCode": "LR"},
    {"name": "Libyan Arab Jamahiriya", "ISD": "+218", "countryCode": "LY"},
    {"name": "Liechtenstein", "ISD": "+423", "countryCode": "LI"},
    {"name": "Lithuania", "ISD": "+370", "countryCode": "LT"},
    {"name": "Luxembourg", "ISD": "+352", "countryCode": "LU"},
    {"name": "Macao", "ISD": "+853", "countryCode": "MO"},
    {"name": "Macedonia", "ISD": "+389", "countryCode": "MK"},
    {"name": "Madagascar", "ISD": "+261", "countryCode": "MG"},
    {"name": "Malawi", "ISD": "+265", "countryCode": "MW"},
    {"name": "Malaysia", "ISD": "+60", "countryCode": "MY"},
    {"name": "Maldives", "ISD": "+960", "countryCode": "MV"},
    {"name": "Mali", "ISD": "+223", "countryCode": "ML"},
    {"name": "Malta", "ISD": "+356", "countryCode": "MT"},
    {"name": "Marshall Islands", "ISD": "+692", "countryCode": "MH"},
    {"name": "Martinique", "ISD": "+596", "countryCode": "MQ"},
    {"name": "Mauritania", "ISD": "+222", "countryCode": "MR"},
    {"name": "Mauritius", "ISD": "+230", "countryCode": "MU"},
    {"name": "Mayotte", "ISD": "+262", "countryCode": "YT"},
    {"name": "Mexico", "ISD": "+52", "countryCode": "MX"},
    {
      "name": "Micronesia, Federated States of Micronesia",
      "ISD": "+691",
      "countryCode": "FM"
    },
    {"name": "Moldova", "ISD": "+373", "countryCode": "MD"},
    {"name": "Monaco", "ISD": "+377", "countryCode": "MC"},
    {"name": "Mongolia", "ISD": "+976", "countryCode": "MN"},
    {"name": "Montenegro", "ISD": "+382", "countryCode": "ME"},
    {"name": "Montserrat", "ISD": "+1664", "countryCode": "MS"},
    {"name": "Morocco", "ISD": "+212", "countryCode": "MA"},
    {"name": "Mozambique", "ISD": "+258", "countryCode": "MZ"},
    {"name": "Myanmar", "ISD": "+95", "countryCode": "MM"},
    {"name": "Namibia", "ISD": "+264", "countryCode": "NA"},
    {"name": "Nauru", "ISD": "+674", "countryCode": "NR"},
    {"name": "Nepal", "ISD": "+977", "countryCode": "NP"},
    {"name": "Netherlands", "ISD": "+31", "countryCode": "NL"},
    {"name": "Netherlands Antilles", "ISD": "+599", "countryCode": "AN"},
    {"name": "New Caledonia", "ISD": "+687", "countryCode": "NC"},
    {"name": "New Zealand", "ISD": "+64", "countryCode": "NZ"},
    {"name": "Nicaragua", "ISD": "+505", "countryCode": "NI"},
    {"name": "Niger", "ISD": "+227", "countryCode": "NE"},
    {"name": "Nigeria", "ISD": "+234", "countryCode": "NG"},
    {"name": "Niue", "ISD": "+683", "countryCode": "NU"},
    {"name": "Norfolk Island", "ISD": "+672", "countryCode": "NF"},
    {"name": "Northern Mariana Islands", "ISD": "+1670", "countryCode": "MP"},
    {"name": "Norway", "ISD": "+47", "countryCode": "NO"},
    {"name": "Oman", "ISD": "+968", "countryCode": "OM"},
    {"name": "Pakistan", "ISD": "+92", "countryCode": "PK"},
    {"name": "Palau", "ISD": "+680", "countryCode": "PW"},
    {
      "name": "Palestinian Territory, Occupied",
      "ISD": "+970",
      "countryCode": "PS"
    },
    {"name": "Panama", "ISD": "+507", "countryCode": "PA"},
    {"name": "Papua New Guinea", "ISD": "+675", "countryCode": "PG"},
    {"name": "Paraguay", "ISD": "+595", "countryCode": "PY"},
    {"name": "Peru", "ISD": "+51", "countryCode": "PE"},
    {"name": "Philippines", "ISD": "+63", "countryCode": "PH"},
    {"name": "Pitcairn", "ISD": "+64", "countryCode": "PN"},
    {"name": "Poland", "ISD": "+48", "countryCode": "PL"},
    {"name": "Portugal", "ISD": "+351", "countryCode": "PT"},
    {"name": "Puerto Rico", "ISD": "+1939", "countryCode": "PR"},
    {"name": "Qatar", "ISD": "+974", "countryCode": "QA"},
    {"name": "Romania", "ISD": "+40", "countryCode": "RO"},
    {"name": "Russia", "ISD": "+7", "countryCode": "RU"},
    {"name": "Rwanda", "ISD": "+250", "countryCode": "RW"},
    {"name": "Reunion", "ISD": "+262", "countryCode": "RE"},
    {"name": "Saint Barthelemy", "ISD": "+590", "countryCode": "BL"},
    {
      "name": "Saint Helena, Ascension and Tristan Da Cunha",
      "ISD": "+290",
      "countryCode": "SH"
    },
    {"name": "Saint Kitts and Nevis", "ISD": "+1869", "countryCode": "KN"},
    {"name": "Saint Lucia", "ISD": "+1758", "countryCode": "LC"},
    {"name": "Saint Martin", "ISD": "+590", "countryCode": "MF"},
    {"name": "Saint Pierre and Miquelon", "ISD": "+508", "countryCode": "PM"},
    {
      "name": "Saint Vincent and the Grenadines",
      "ISD": "+1784",
      "countryCode": "VC"
    },
    {"name": "Samoa", "ISD": "+685", "countryCode": "WS"},
    {"name": "San Marino", "ISD": "+378", "countryCode": "SM"},
    {"name": "Sao Tome and Principe", "ISD": "+239", "countryCode": "ST"},
    {"name": "Saudi Arabia", "ISD": "+966", "countryCode": "SA"},
    {"name": "Senegal", "ISD": "+221", "countryCode": "SN"},
    {"name": "Serbia", "ISD": "+381", "countryCode": "RS"},
    {"name": "Seychelles", "ISD": "+248", "countryCode": "SC"},
    {"name": "Sierra Leone", "ISD": "+232", "countryCode": "SL"},
    {"name": "Singapore", "ISD": "+65", "countryCode": "SG"},
    {"name": "Slovakia", "ISD": "+421", "countryCode": "SK"},
    {"name": "Slovenia", "ISD": "+386", "countryCode": "SI"},
    {"name": "Solomon Islands", "ISD": "+677", "countryCode": "SB"},
    {"name": "Somalia", "ISD": "+252", "countryCode": "SO"},
    {"name": "South Africa", "ISD": "+27", "countryCode": "ZA"},
    {"name": "South Sudan", "ISD": "+211", "countryCode": "SS"},
    {
      "name": "South Georgia and the South Sandwich Islands",
      "ISD": "+500",
      "countryCode": "GS"
    },
    {"name": "Spain", "ISD": "+34", "countryCode": "ES"},
    {"name": "Sri Lanka", "ISD": "+94", "countryCode": "LK"},
    {"name": "Sudan", "ISD": "+249", "countryCode": "SD"},
    {"name": "Suriname", "ISD": "+597", "countryCode": "SR"},
    {"name": "Svalbard and Jan Mayen", "ISD": "+47", "countryCode": "SJ"},
    {"name": "Swaziland", "ISD": "+268", "countryCode": "SZ"},
    {"name": "Sweden", "ISD": "+46", "countryCode": "SE"},
    {"name": "Switzerland", "ISD": "+41", "countryCode": "CH"},
    {"name": "Syrian Arab Republic", "ISD": "+963", "countryCode": "SY"},
    {"name": "Taiwan", "ISD": "+886", "countryCode": "TW"},
    {"name": "Tajikistan", "ISD": "+992", "countryCode": "TJ"},
    {
      "name": "Tanzania, United Republic of Tanzania",
      "ISD": "+255",
      "countryCode": "TZ"
    },
    {"name": "Thailand", "ISD": "+66", "countryCode": "TH"},
    {"name": "Timor-Leste", "ISD": "+670", "countryCode": "TL"},
    {"name": "Togo", "ISD": "+228", "countryCode": "TG"},
    {"name": "Tokelau", "ISD": "+690", "countryCode": "TK"},
    {"name": "Tonga", "ISD": "+676", "countryCode": "TO"},
    {"name": "Trinidad and Tobago", "ISD": "+1868", "countryCode": "TT"},
    {"name": "Tunisia", "ISD": "+216", "countryCode": "TN"},
    {"name": "Turkey", "ISD": "+90", "countryCode": "TR"},
    {"name": "Turkmenistan", "ISD": "+993", "countryCode": "TM"},
    {"name": "Turks and Caicos Islands", "ISD": "+1649", "countryCode": "TC"},
    {"name": "Tuvalu", "ISD": "+688", "countryCode": "TV"},
    {"name": "Uganda", "ISD": "+256", "countryCode": "UG"},
    {"name": "Ukraine", "ISD": "+380", "countryCode": "UA"},
    {"name": "United Arab Emirates", "ISD": "+971", "countryCode": "AE"},
    {"name": "United Kingdom", "ISD": "+44", "countryCode": "GB"},
    {"name": "United States", "ISD": "+1", "countryCode": "US"},
    {"name": "Uruguay", "ISD": "+598", "countryCode": "UY"},
    {"name": "Uzbekistan", "ISD": "+998", "countryCode": "UZ"},
    {"name": "Vanuatu", "ISD": "+678", "countryCode": "VU"},
    {
      "name": "Venezuela, Bolivarian Republic of Venezuela",
      "ISD": "+58",
      "countryCode": "VE"
    },
    {"name": "Vietnam", "ISD": "+84", "countryCode": "VN"},
    {"name": "Virgin Islands, British", "ISD": "+1284", "countryCode": "VG"},
    {"name": "Virgin Islands, U.S.", "ISD": "+1340", "countryCode": "VI"},
    {"name": "Wallis and Futuna", "ISD": "+681", "countryCode": "WF"},
    {"name": "Yemen", "ISD": "+967", "countryCode": "YE"},
    {"name": "Zambia", "ISD": "+260", "countryCode": "ZM"},
    {"name": "Zimbabwe", "ISD": "+263", "countryCode": "ZW"}
  ];
}
