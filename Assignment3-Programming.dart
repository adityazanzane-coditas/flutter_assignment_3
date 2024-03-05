//bubble sort method to use it in all the below questions
//for integer
List<int> bubbleSort(List<int> array) {
  int length = array.length;
  for (int outerIndex = 0; outerIndex < length; outerIndex++) {
    for (int innerIndex = 0;
        innerIndex < length - outerIndex - 1;
        innerIndex++) {
      if (array[innerIndex] > array[innerIndex + 1]) {
        int temp = array[innerIndex];
        array[innerIndex] = array[innerIndex + 1];
        array[innerIndex + 1] = temp;
      }
    }
  }
  return array;
}

//for String
List<String> bubbleSortStrings(List<String> array) {
  int length = array.length;
  for (int outerIndex = 0; outerIndex < length; outerIndex++) {
    for (int innerIndex = 0;
        innerIndex < length - outerIndex - 1;
        innerIndex++) {
      if (array[innerIndex].compareTo(array[innerIndex + 1]) > 0) {
        String temp = array[innerIndex];
        array[innerIndex] = array[innerIndex + 1];
        array[innerIndex + 1] = temp;
      }
    }
  }
  return array;
}

List<int> sortedSquares(List<int> numbers) {
  List<int> squaredValues = [];
  for (int number in numbers) {
    squaredValues.add(number * number); // Squaring the number
  }
  squaredValues = bubbleSort(squaredValues); // Sorting the squared values
  return squaredValues;
}

List<int> sumOfTwoNumbers(List<int> nums, int target) {
  List<int> result = [];
  for (int outerIndex = 0; outerIndex < nums.length; outerIndex++) {
    for (int innerIndex = outerIndex + 1;
        innerIndex < nums.length;
        innerIndex++) {
      if (nums[outerIndex] + nums[innerIndex] == target) {
        result = [outerIndex, innerIndex];
      }
    }
  }
  return result;
}

String longestCommonPrefix(List<String> strs) {
  String commonPrefix = '';
  strs = bubbleSortStrings(strs);
  for (int index = 0; index < strs[0].length; index++) {
    if (strs[0][index] == strs[strs.length - 1][index]) {
      commonPrefix += strs[0][index];
    } else {
      break;
    }
  }
  return commonPrefix;
}

int getlengthOfLongestSubstring(String string) {
  int maxLength = 0;
  StringBuffer substringBuffer = StringBuffer('');
  for (int outerLoop = 0; outerLoop < string.length; outerLoop++) {
    String currentChar = string[outerLoop];
    int index = substringBuffer.toString().indexOf(currentChar);
    if (index != -1) {
      substringBuffer =
          StringBuffer(substringBuffer.toString().substring(index + 1));
    }
    substringBuffer.write(currentChar);
    maxLength = maxOfTwo(maxLength, substringBuffer.length);
  }
  return maxLength;
}

int maxOfTwo(int a, int b) {
  return (a > b) ? a : b;
}

List<int> intersect(List<int> nums1, List<int> nums2) {
  List<int> result = [];
  nums1 = bubbleSort(nums1);
  nums2 = bubbleSort(nums2);

  int pointer1 = 0, pointer2 = 0;

  while (pointer1 < nums1.length && pointer2 < nums2.length) {
    if (nums1[pointer1] == nums2[pointer2]) {
      result.add(nums1[pointer1]);
      pointer1++;
      pointer2++;
    } else if (nums1[pointer1] > nums2[pointer2]) {
      pointer2++;
    } else {
      pointer1++;
    }
  }
  return result;
}

bool isAnagram(String string, String target) {
  if (string.length != target.length) {
    return false;
  }
  List<String> stringChars = string.split('');
  List<String> targetChars = target.split('');

  stringChars = bubbleSortStrings(stringChars);
  targetChars = bubbleSortStrings(targetChars);

  String sortedString = stringChars.join();
  String sortedTarget = targetChars.join();

  return sortedString == sortedTarget;
}

class TreeNode {
  int value;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.value = 0, this.left, this.right]);
}

void inorderTraversal(TreeNode? root) {
  if (root == null) return;
  inorderTraversal(root.left);
  print(root.value);
  inorderTraversal(root.right);
}

void preOrderTraversal(TreeNode? root) {
  if (root == null) return;
  print(root.value);
  preOrderTraversal(root.left);
  preOrderTraversal(root.right);
}

void postOrderTraversal(TreeNode? root) {
  if (root == null) return;
  postOrderTraversal(root.left);
  postOrderTraversal(root.right);
  print(root.value);
}

String intToRoman(int number) {
  List<String> romanSymbols = [
    "M",
    "CM",
    "D",
    "CD",
    "C",
    "XC",
    "L",
    "XL",
    "X",
    "IX",
    "V",
    "IV",
    "I"
  ];
  List<int> numericalValues = [
    1000,
    900,
    500,
    400,
    100,
    90,
    50,
    40,
    10,
    9,
    5,
    4,
    1
  ];

  String roman = '';
  int index = 0;

  while (index < romanSymbols.length) {
    while (number >= numericalValues[index]) {
      roman += romanSymbols[index];
      number -= numericalValues[index];
    }
    index++;
  }
  return roman;
}

String reverseWords(String inputString) {
//1st method
  // List<String> words = s.trim().split(RegExp(r'\s+'));
  // words = words.reversed.toList();
  // return words.join(' ');

//2nd Method
  if (inputString.isEmpty) {
    return '';
  }

  StringBuffer result = StringBuffer();
  int endIndex = inputString.length - 1;

  while (endIndex >= 0) {
    while (endIndex >= 0 && inputString[endIndex] == ' ') {
      endIndex--;
    }

    int wordEndIndex = endIndex;

    while (endIndex >= 0 && inputString[endIndex] != ' ') {
      endIndex--;
    }

    for (int startIndex = endIndex + 1;
        startIndex <= wordEndIndex;
        startIndex++) {
      result.write(inputString[startIndex]);
    }

    if (endIndex >= 0) {
      result.write(' ');
    }
  }

  return result.toString();
}

String removeDuplicateLetters(String letters) {
  Map<String, int> lastOccurence = {};

  for (int index = 0; index < letters.length; index++) {
    lastOccurence[letters[index]] = index;
  }

  List<String> stack = [];
  Set<String> visited = {};

  for (int index = 0; index < letters.length; index++) {
    String char = letters[index];

    if (visited.contains(char)) {
      continue;
    }

    while (stack.isNotEmpty &&
        stack.last.compareTo(char) > 0 &&
        lastOccurence[stack.last]! > index) {
      visited.remove(stack.removeLast());
    }
    stack.add(char);
    visited.add(char);
  }
  return stack.join('');
}

void main() {
  // 1. Sorted Squares
  List<int> number = [-4, -1, 0, 3, 10];
  print("1.");
  print("Input: $number");
  List<int> values = sortedSquares(number);
  print("Output: $values");
  print(
      '========================================================================');

  // 2. Sum of Two Numbers
  List<int> nums1 = [2, 7, 11, 15];
  int target1 = 9;
  print("2.");
  print("Input: nums = $nums1");
  print("Output: ${sumOfTwoNumbers(nums1, target1)}");

  List<int> nums2 = [3, 2, 4];
  int target2 = 6;
  print("Input: nums = $nums2");
  print("Output: ${sumOfTwoNumbers(nums2, target2)}");
  print(
      '========================================================================');

  // 3. Longest Common Prefix
  List<String> strs1 = ["dog", "racecar", "car"];
  print("3.");
  print("Input: strs = $strs1");
  print("Output: ${longestCommonPrefix(strs1)}");
  print(
      '========================================================================');

  // 4. Length of Longest Substring
  String string = 'abcabcbb';
  print("4.");
  print(
      'The length of substring is: "$string" is: ${getlengthOfLongestSubstring(string)}');
  print(
      '========================================================================');

  // 5. Intersection of Two Arrays
  List<int> nums3 = [2, 2];
  print("5.");
  print("Input: nums1 = $nums1, nums2 = $nums3");
  print("Output: ${intersect(nums1, nums3)}");

  List<int> nums4 = [4, 9, 5];
  List<int> nums5 = [9, 4, 9, 8, 4];
  print("Input: nums3 = $nums4, nums4 = $nums5");
  print("Output: ${intersect(nums4, nums5)}");
  print(
      '========================================================================');

  // 6. Valid Anagram
  String s1 = "anagram";
  String t1 = "nagaram";
  String s2 = "rat";
  String t2 = "car";
  print("6.");
  print("${isAnagram(s1, t1)}");
  print("${isAnagram(s2, t2)}");
  print(
      '========================================================================');

  // 7. Tree Traversals
  TreeNode root = TreeNode(
    1,
    TreeNode(2, TreeNode(4), TreeNode(5)),
    TreeNode(3, TreeNode(6), TreeNode(7)),
  );
  print("7.");
  print('Inorder traversal:');
  inorderTraversal(root);

  print('Pre-order traversal:');
  preOrderTraversal(root);

  print('Post-order traversal:');
  postOrderTraversal(root);
  print(
      '========================================================================');

  // 8. Integer to Roman
  print("8.");
  print(intToRoman(994));
  print(intToRoman(58));
  print(intToRoman(1994));
  print(
      '========================================================================');

  // 9. Reverse Words in a String
  print("9.");
  String inputString = "a good   example";
  print(reverseWords(inputString));
  print(
      '========================================================================');

  // 10. Remove Duplicate Letters
  String letter = "bcabc";
  print("10.");
  print("Input the letters: $letter");
  print("Output the letters: ${removeDuplicateLetters(letter)}");
  print(
      '========================================================================');
}
