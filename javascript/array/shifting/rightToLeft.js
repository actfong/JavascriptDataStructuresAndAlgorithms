// The idea of this exercise to to shift all elements within an array
// from RIGHT to LEFT by one position, where the value of the first index
// will be moved to the last index.
// The constraint here is to achieve this without initializing 
// another array where we could paste values from the original array.

// Example => shiftLeftToRight([1,2,3,4]) #=> [4,1,2,3]

// Variation 1, iterating from left to right
function shiftRightToLeft_1(arr){
  lastToMutateIndex = arr.length - 2;
  lastValue = null;
  for(i=0; i <= lastToMutateIndex; i++){
    if(arr[i-1] == undefined){
      lastValue = arr[arr.length-1];
      arr[arr.length-1] = arr[i];
      arr[i] = arr[i+1];
    }else if(i == lastToMutateIndex){
      arr[i] = lastValue;
    }else{
      arr[i] = arr[i+1];
    }
  }
  return arr;
}

var numbers = [1,2,3,4,5,6,7,8,9]
console.log(shiftRightToLeft_1(numbers));