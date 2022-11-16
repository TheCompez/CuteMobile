var delimiter = ' و ';
var zero = 'صفر';
var negative = 'منفی ';
var letters = [['', 'یک', 'دو', 'سه', 'چهار', 'پنج', 'شش', 'هفت', 'هشت', 'نه'], ['ده', 'یازده', 'دوازده', 'سیزده', 'چهارده', 'پانزده', 'شانزده', 'هفده', 'هجده', 'نوزده', 'بیست'], ['', '', 'بیست', 'سی', 'چهل', 'پنجاه', 'شصت', 'هفتاد', 'هشتاد', 'نود'], ['', 'یکصد', 'دویست', 'سیصد', 'چهارصد', 'پانصد', 'ششصد', 'هفتصد', 'هشتصد', 'نهصد'], ['', ' هزار', ' میلیون', ' میلیارد', ' بیلیون', ' بیلیارد', ' تریلیون', ' تریلیارد', ' کوآدریلیون', ' کادریلیارد', ' کوینتیلیون', ' کوانتینیارد', ' سکستیلیون', ' سکستیلیارد', ' سپتیلیون', ' سپتیلیارد', ' اکتیلیون', ' اکتیلیارد', ' نانیلیون', ' نانیلیارد', ' دسیلیون', ' دسیلیارد']];
var decimalSuffixes = ['', 'دهم', 'صدم', 'هزارم', 'ده‌هزارم', 'صد‌هزارم', 'میلیونوم', 'ده‌میلیونوم', 'صدمیلیونوم', 'میلیاردم', 'ده‌میلیاردم', 'صد‌‌میلیاردم'];
var prepareNumber = function prepareNumber(num) {
  var Out = num;

  if (typeof Out === 'number') {
    Out = Out.toString();
  }

  var NumberLength = Out.length % 3;

  if (NumberLength === 1) {
    Out = "00".concat(Out);
  } else if (NumberLength === 2) {
    Out = "0".concat(Out);
  }
  return Out.replace(/\d{3}(?=\d)/g, '$&*').split('*');
};

var threeNumbersToLetter = function threeNumbersToLetter(num) {
  if (parseInt(num, 0) === 0) {
    return '';
  }

  var parsedInt = parseInt(num, 0);

  if (parsedInt < 10) {
    return letters[0][parsedInt];
  }

  if (parsedInt <= 20) {
    return letters[1][parsedInt - 10];
  }

  if (parsedInt < 100) {
    var _one = parsedInt % 10;

    var _ten = (parsedInt - _one) / 10;

    if (_one > 0) {
      return letters[2][_ten] + delimiter + letters[0][_one];
    }

    return letters[2][_ten];
  }

  var one = parsedInt % 10;
  var hundreds = (parsedInt - parsedInt % 100) / 100;
  var ten = (parsedInt - (hundreds * 100 + one)) / 10;
  var out = [letters[3][hundreds]];
  var SecondPart = ten * 10 + one;

  if (SecondPart > 0) {
    if (SecondPart < 10) {
      out.push(letters[0][SecondPart]);
    } else if (SecondPart <= 20) {
      out.push(letters[1][SecondPart - 10]);
    } else {
      out.push(letters[2][ten]);

      if (one > 0) {
        out.push(letters[0][one]);
      }
    }
  }

  return out.join(delimiter);
};
var convertDecimalPart = function convertDecimalPart(decimalPart) {
  decimalPart = decimalPart.replace(/0*$/, "");

  if (decimalPart === '') {
    return '';
  }

  if (decimalPart.length > 11) {
    decimalPart = decimalPart.substr(0, 11);
  }

  return ' ممیز ' + num2Persian(decimalPart) + ' ' + decimalSuffixes[decimalPart.length];
};
function num2Persian(input) {
  input = input.toString().replace(/[^0-9.-]/g, '');
  var isNegative = false;
  var floatParse = parseFloat(input);
  if (isNaN(floatParse)) {
    return zero;
  }
  if (floatParse === 0) {
    return zero;
  }
  if (floatParse < 0) {
    isNegative = true;
    input = input.replace(/-/g, '');
  }
  var decimalPart = '';
  var integerPart = input;
  var pointIndex = input.indexOf('.');
  if (pointIndex > -1) {
    integerPart = input.substring(0, pointIndex);
    decimalPart = input.substring(pointIndex + 1, input.length);
  }
  if (integerPart.length > 66) {
    return 'خارج از محدوده';
  }
  var slicedNumber = prepareNumber(integerPart);
  var Output = [];
  var SplitLength = slicedNumber.length;

  for (var i = 0; i < SplitLength; i += 1) {
    var SectionTitle = letters[4][SplitLength - (i + 1)];
    var converted = threeNumbersToLetter(slicedNumber[i]);

    if (converted !== '') {
      Output.push(converted + SectionTitle);
    }
  }
  if (decimalPart.length > 0) {
    decimalPart = convertDecimalPart(decimalPart);
  }

  return (isNegative ? negative : '') + Output.join(delimiter) + decimalPart;
};
//console.log(num2Persian("50"));
//console.log(num2Persian("500"));
//console.log(num2Persian("5000"));
//console.log(num2Persian("50000"));
//console.log(num2Persian("500000"));
//console.log(num2Persian("5000000"));
//console.log(num2Persian("50000000"));
//console.log(num2Persian("500000000"));
