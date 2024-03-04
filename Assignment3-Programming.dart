// 1.
// Given an integer array nums sorted in non-decreasing order, return an array of the squares of each number sorted in non-decreasing order.

// Example 1:
// Input: nums = [-4,-1,0,3,10]
// Output: [0,1,9,16,100]
// Explanation: After squaring, the array becomes [16,1,0,9,100].
// After sorting, it becomes [0,1,9,16,100].

// Example 2:
// Input: nums = [-7,-3,2,3,11]
// Output: [4,9,9,49,121]

// ========================================================================

class SortedArray {
  List<int> sortedSquares(List<int> number) {
    List<int> values = [];
    for (int index in number) {
      values.add(index * index); //Squaring the index(values)
    }
    values.sort(); //Sorting the values
    return values;
  }
}

// 2.

// Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
// You may assume that each input would have exactly one solution, and you may not use the same element twice.
// You can return the answer in any order.

// Example 1:
// Input: nums = [2,7,11,15], target = 9
// Output: [0,1]
// Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].

// Example 2:
// Input: nums = [3,2,4], target = 6
// Output: [1,2]

// Example 3:
// Input: nums = [3,3], target = 6
// Output: [0,1]

// ========================================================================

//for loop approach
class IntegerTarget {
  List<int> sumOfTwoNumbers(List<int> number, int target) {
    List<int> result = [];
    for (int iteration1 = 0; iteration1 < number.length; iteration1++) {
      for (int iteration2 = iteration1 + 1;
          iteration2 < number.length;
          iteration2++) {
        if (number[iteration1] + number[iteration2] == target) {
          result = [iteration1, iteration2];
        }
      }
    }
    return result;
  }
}

//Optimised Code using HashMap
class IntegerTargetApproach2 {
  List<int> sumOfNumbers(List<int> number, int target) {
    Map<int, int> indexes = {};

    for (int iteration = 0; iteration < number.length; iteration++) {
      int conditionalValue = target - number[iteration];
      if (indexes.containsKey(conditionalValue)) {
        return [indexes[conditionalValue]!, iteration];
      }
      indexes[number[iteration]] = iteration;
    }
    return [];
  }
}

// 3.
// Write a function to find the longest common prefix string amongst an array of strings.
// If there is no common prefix, return an empty string "".

// Example 1:
// Input: strs = ["flower","flow","flight"]
// Output: "fl"

// Example 2:
// Input: strs = ["dog","racecar","car"]
// Output: ""
// Explanation: There is no common prefix among the input strings.

// ========================================================================

class ArrayOfString {
  String longestCommonPrefix(List<String> strs) {
    String commonPrefix = '';
    strs.sort();
    for (int iteration = 0; iteration < strs[0].length; iteration++) {
      if (strs[0][iteration] == strs[strs.length - 1][iteration]) {
        commonPrefix += strs[0][iteration];
      } else {
        break;
      }
    }
    return commonPrefix;
  }
}

// 4.
// Given a string s, find the length of the longest
// substring
// without repeating characters.

// Example 1:
// Input: s = "abcabcbb"
// Output: 3
// Explanation: The answer is "abc", with the length of 3.

// Example 2:
// Input: s = "bbbbb"
// Output: 1
// Explanation: The answer is "b", with the length of 1.

// Example 3:
// Input: s = "pwwkew"
// Output: 3
// Explanation: The answer is "wke", with the length of 3.
// Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.

// ========================================================================

class LengthOfSubstring {
  int lengthOfLongestSubstring(String string) {
    int max = 0;
    StringBuffer sb = StringBuffer('');
    for (int index = 0; index < string.length; index++) {
      String currentChar = string[index];
      int ind = sb.toString().indexOf(currentChar);
      if (ind != -1) {
        sb = StringBuffer(sb.toString().substring(ind + 1));
      }
      sb.write(currentChar);
      max = maxOfTwo(max, sb.length);
    }
    return max;
  }

  int maxOfTwo(int a, int b) {
    return (a > b) ? a : b;
  }
}

// 5.
// Given two integer arrays nums1 and nums2, return an array of their intersection. Each element in the result must appear as many times as it shows in both arrays and you may return the result in any order.

// Example 1:
// Input: nums1 = [1,2,2,1], nums2 = [2,2]
// Output: [2,2]

// Example 2:
// Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
// Output: [4,9]
// Explanation: [9,4] is also accepted.
// ========================================================================

class Intersection {
  List<int> intersect(List<int> nums1, List<int> nums2) {
    List<int> result = [];
    nums1.sort();
    nums2.sort();

    int nums1Pointer = 0, nums2Pointer = 0;

    while (nums1Pointer < nums1.length && nums2Pointer < nums2.length) {
      if (nums1[nums1Pointer] == nums2[nums2Pointer]) {
        result.add(nums1[nums1Pointer]);
        nums1Pointer++;
        nums2Pointer++;
      } else if (nums1[nums1Pointer] > nums2[nums2Pointer]) {
        nums2Pointer++;
      } else {
        nums1Pointer++;
      }
    }
    return result;
  }
}

// 6.
// Given two strings s and t, return true if t is an anagram of s, and false otherwise.
// An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.

// Example 1:
// Input: s = "anagram", t = "nagaram"
// Output: true

// Example 2:
// Input: s = "rat", t = "car"
// Output: false
// ========================================================================

class Anagram {
  bool isAnagram(String s, String t) {
    if (s.length != t.length) {
      return false;
    }
    List<String> sList = s.split('');
    List<String> tList = t.split('');

    sList.sort();
    tList.sort();

    String sJoin = sList.join();
    String tJoin = tList.join();

    return sJoin == tJoin;
  }
}

// 7.
// Implement Inorder, preorder and postorder traversal of tree.
// Use the below class to construct your tree data structure.
// /**
// * Definition for a binary tree node.
// * class TreeNode {
// *   int val;
// *   TreeNode? left;
// *   TreeNode? right;
// *   TreeNode([this.val = 0, this.left, this.right]);
// * }
// */
// ========================================================================

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

void inorderTraversal(TreeNode? root) {
  if (root == null) return;
  inorderTraversal(root.left);
  print(root.val);
  inorderTraversal(root.right);
}

void preOrderTraversal(TreeNode? root) {
  if (root == null) return;
  print(root.val);
  preOrderTraversal(root.left);
  preOrderTraversal(root.right);
}

void postOrderTraversal(TreeNode? root) {
  if (root == null) return;
  postOrderTraversal(root.left);
  postOrderTraversal(root.right);
  print(root.val);
}

// 8.
// Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.
// Symbol       Value
// I             1
// V             5
// X             10
// L             50
// C             100
// D             500
// M             1000
// For example, 2 is written as II in Roman numeral, just two one's added together. 12 is written as XII, which is simply X + II. The number 27 is written as XXVII, which is XX + V + II.
// Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:
// I can be placed before V (5) and X (10) to make 4 and 9.
// X can be placed before L (50) and C (100) to make 40 and 90.
// C can be placed before D (500) and M (1000) to make 400 and 900.
// Given an integer, convert it to a roman numeral.

// Example 1:
// Input: num = 3
// Output: "III"
// Explanation: 3 is represented as 3 ones.

// Example 2:
// Input: num = 58
// Output: "LVIII"
// Explanation: L = 50, V = 5, III = 3.

// Example 3:
// Input: num = 1994
// Output: "MCMXCIV"
// Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.
// ========================================================================

class RomanNumerals {
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

    while (index < 13) {
      while (number >= numericalValues[index]) {
        roman += romanSymbols[index];
        number -= numericalValues[index];
      }
      index++;
    }
    return roman;
  }
}

// 9.
//  Given an input string s, reverse the order of the words.
// A word is defined as a sequence of non-space characters. The words in s will be separated by at least one space.
// Return a string of the words in reverse order concatenated by a single space.
// Note that s may contain leading or trailing spaces or multiple spaces between two words. The returned string should only have a single space separating the words. Do not include any extra spaces.

// Example 1:
// Input: s = "the sky is blue"
// Output: "blue is sky the"

// Example 2:
// Input: s = "  hello world  "
// Output: "world hello"
// Explanation: Your reversed string should not contain leading or trailing spaces.

// Example 3:
// Input: s = "a good   example"
// Output: "example good a"
// Explanation: You need to reduce multiple spaces between two words to a single space in the reversed string.
// ========================================================================

class ReverseWords {
  String reverseWords(String s) {
    List<String> words = s.trim().split(RegExp(r'\s+'));
    words = words.reversed.toList();
    return words.join(' ');
  }
}

// 10.
// Given a string s, remove duplicate letters so that every letter appears once and only once. You must make sure your result is
// the smallest in lexicographical order
// among all possible results.

// Example 1:
// Input: s = "bcabc"
// Output: "abc"

// Example 2:
// Input: s = "cbacdcbc"
// Output: "acdb"

// ========================================================================
class DuplicateLetters {
  String removeDuplicateLetters(String letter) {
    Map<String, int> lastOccurence = {};

    for (int index = 0; index < letter.length; index++) {
      lastOccurence[letter[index]] = index;
    }

    List<String> stack = [];

    Set<String> visited = {};

    for (int index = 0; index < letter.length; index++) {
      String char = letter[index];

      if (visited.contains(char)) {
        continue;
      }

      //lexico
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
}

//void main block of code
//1
void main() {
  SortedArray sortedArray = SortedArray();

  List<int> number = [-4, -1, 0, 3, 10];
  print("1.");
  print("Input: $number");
  List<int> values = sortedArray.sortedSquares(number);
  print("Output: $values");
  print(
      '========================================================================');

//2

  IntegerTarget targetValue = IntegerTarget();
  List<int> nums = [2, 7, 11, 15];
  int target1 = 9;
  print("2.");
  print("Input: nums = $nums");
  print("Output: ${targetValue.sumOfTwoNumbers(nums, target1)}");

  IntegerTargetApproach2 targetValue2 = IntegerTargetApproach2();
  List<int> list1 = [3, 2, 4];
  int target2 = 6;
  print("2.");
  print("Input: nums = $list1");
  print("Output: ${targetValue2.sumOfNumbers(list1, target2)}");
  print(
      '========================================================================');

//3
  ArrayOfString array = ArrayOfString();
  List<String> strs1 = ["dog", "racecar", "car"];
  print("3.");
  print("Input: strs = $strs1");
  print("Output: ${array.longestCommonPrefix(strs1)}");
  print(
      '========================================================================');

//4
  LengthOfSubstring lengthOfSubstring = LengthOfSubstring();

  String string = 'abcabcbb';
  print("4.");
  print(
      'The length of substring is: "$string" is: ${lengthOfSubstring.lengthOfLongestSubstring(string)}');
  print(
      '========================================================================');
//5

  Intersection intersection = Intersection();
  List<int> nums1 = [1, 2, 2, 1];
  List<int> nums2 = [2, 2];
  print("5.");
  print("Input: nums1 = $nums1, nums2 = $nums2");
  print("Output: ${intersection.intersect(nums1, nums2)}");
  print(
      '========================================================================');

  List<int> nums3 = [4, 9, 5];
  List<int> nums4 = [9, 4, 9, 8, 4];
  print("5.");
  print("Input: nums3 = $nums3, nums4 = $nums4");
  print("Output: ${intersection.intersect(nums3, nums4)}");
  print(
      '========================================================================');

//6
  Anagram anagram = Anagram();

  String s1 = "anagram";
  String t1 = "nagaram";
  String s2 = "rat";
  String t2 = "car";
  print("6.");
  print("${anagram.isAnagram(s1, t1)}");
  print("${anagram.isAnagram(s2, t2)}");
  print(
      '========================================================================');

//7
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

//8
  RomanNumerals romanNumerals = RomanNumerals();
  print("8.");
  print(romanNumerals.intToRoman(994));
  print(romanNumerals.intToRoman(58));
  print(romanNumerals.intToRoman(1994));
  print(
      '========================================================================');

//9
  ReverseWords reverseWords = ReverseWords();
  print("9.");
  print(reverseWords.reverseWords("a good   example"));
  print(
      '========================================================================');

//10
  DuplicateLetters removeDuplicateLetters = DuplicateLetters();
  print("10.");
  String letter = "bcabc";
  print("Input the letters: $letter");
  print(
      "Output the letters: ${removeDuplicateLetters.removeDuplicateLetters(letter)}");
  print(
      '========================================================================');
}
