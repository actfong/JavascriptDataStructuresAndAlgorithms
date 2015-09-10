// The idea of this exercise to to shift all elements within an array
// from left to right by one position, where the value of the last index
// will be moved to the first index.
// The constraint here is to achieve this 
// 1. Without initializing another array where we could paste values from the original array.
// 2. Without resizing the given array

// Example => shiftLeftToRight([1,2,3,4]) #=> [2,3,4,1]

var numbers = [1,2,3,4,5,6,7,8,9]

// Variation 1, iterating from left to right
function shiftLeftToRight_1(arr){
  memo = null;
  for (i = 0; i < arr.length; i++){
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
console.log(shiftLeftToRight_1(numbers));


// Variation 2, iterating from right to left
function shiftLeftToRight_2(arr){
  lastValue = null;

  for(i = (arr.length - 1); i >= 0; i--){
    if(arr[i+1] == undefined){
      lastValue = arr[i];
      arr[i] = arr[i-1];
    }else if(arr[i-1] == undefined){
      arr[i] = lastValue;
    }else{
      arr[i] = arr[i-1];
    }
  }
  return arr;
}

console.log(shiftLeftToRight_2(numbers));