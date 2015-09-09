// The idea of this exercise to to shift all elements within an array
// from left to right by one position, where the value of the last index
// will be moved to the first index.
// The constraint here is to achieve this without initializing 
// another array where we could paste values from the original array.

// Example => shiftLeftToRight([1,2,3,4]) #=> [2,3,4,1]

// Variation 1, looping from left to right
function shiftLeftToRight_1(arr){
  memo = null;
  for (i = 0; i < arr.length; i++) {
    if(arr[i-1] == undefined){
      memo = arr[i];
      arr[i] = arr.slice(i - 1)[0];      
    }else{
      current = arr[i];
      arr[i] = memo;
      memo = current;
    }
  }
  return arr;
}

var numbers = [1,2,3,4,5,6,7,8,9]
console.log(shiftLeftToRight_1(numbers));
