// You have an array of integers, and for each index you want to find the product of every integer except the integer at that index.
// Write a function getProductsOfAllIntsExceptAtIndex() that takes an array of integers and returns an array of the products.
//
// For example, given:
//
//   [1, 7, 3, 4]
//
// your function would return:
//
//   [84, 12, 28, 21]
//
// by calculating:
//
//   [7 * 3 * 4,  1 * 3 * 4,  1 * 7 * 4,  1 * 7 * 3]
//
// Do not use division in your solution.


// 1. Make an empty array
// 2a. Take the first number in array (first iteration)
//    2b. Multiply across all other elements in the array (second iteration)
//      2bc. iterate across all indexes EXCEPT the current one and multiply everything.
//            {if index == count}
//      2c. take the result and push it into a new array.
// 3a.  move to the next number in the array
//    3b.
const array = [1, 7, 3, 5]
const new_array = []

//brute force method below
  array.map((number, index)=>{ // 0n
    array_length = array.length //set the stuff
      for (var i = 0; i < array_length; i++){ //0n^2
        if (i !== index){

        }

    }

  })
}
