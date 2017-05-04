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
//            {if index !== count}
//      2c. take the result and push it into a new array.
// 3a.  move to the next number in the array
//    3b.
const array = [1, 7, 0, 3]
const new_array = []

//brute force method below
  array.map((number, index)=>{ // 0n
    array_length = array.length //set the stuff
    current_product = 1
      for (var i = 0; i < array_length; i++){ //0n^2
        if (i !== index){
          current_product = array[i] * current_product
        }
      }
      new_array.push(current_product)
    })

    //---It works!!!--//

//greedy method below.

//Think about how we can be STORING patterns.
//In this example think about the different patterns of multiplicatio
// [7*(0*3), 1*(0*3), 1*7*3]

//step1. Create two arrays.
//    1a. One for all values BEFORE indices
//    1b. One for all values AFTER indicies
//      1c.Run two for loops.  This is 0(2n) which is the same as 0(n)

var product_before_index = []
// for each integer, find the product of all the integers

var productSoFar = 1; // before it, storing the total product so far each time
for (var i = 0; i < array.length; i++) {
    productsOfAllIntsBeforeIndex[i] = productSoFar;
    productSoFar *= array[i];
}

var product_after_index = [];

var productSoFar = 1;
for (var i = intArray.length - 1; i >= 0; i--) {
    productsOfAllIntsAfterIndex[i] = productSoFar;
    productSoFar *= intArray[i];
}

// this greedy method requires too many arrays.  You'd have to then multiply both of these according to their indexes.


//------FINAL GREEDY SOLUTION------//

function getProductsOfAllIntsExceptAtIndex(intArray) {

    // make sure we have at least 2 prices
    if (intArray.length < 2) {
        throw new Error('Getting the product of numbers at other indices requires at least 2 numbers');
    }

    var productsOfAllIntsExceptAtIndex = [];

    // for each integer, we find the product of all the integers
    // before it, storing the total product so far each time
    var productSoFar = 1;
    for (var i = 0; i < intArray.length; i++) {
        productsOfAllIntsExceptAtIndex[i] = productSoFar;
        productSoFar *= intArray[i];
    }

    // for each integer, we find the product of all the integers
    // after it. since each index in products already has the
    // product of all the integers before it, now we're storing
    // the total product of all other integers
    productSoFar = 1;
    for (var j = intArray.length - 1; j >= 0; j--) {
        productsOfAllIntsExceptAtIndex[j] *= productSoFar;
        productSoFar *= intArray[j];
    }

    return productsOfAllIntsExceptAtIndex;
}
