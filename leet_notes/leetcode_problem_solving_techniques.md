# Top 100 liked questions

## Python tricky & important codes and DS

#### Hashmap
Get the keys,
```
hashmap = {'a': 1, 'b': 2, 'c': 3}
# Iterate over the hashmap keys
for key in hashmap:
    print(key)
    # I get the value of this key with this hashmap[key]
```
Get the keys and value,
```
hashmap = {'a': 1, 'b': 2, 'c': 3}
# Iterate over the hashmap keys and values
for key, value in hashmap.items():
    print(key, value)
```

#### defaultdict vs dict
`defaultdict` is a class from the collections module in the Python standard library. It is a subclass of the built-in `dict` type. **The main difference between a `defaultdict` and a regular `dict` is how it handles missing keys. When you access a key that does not exist in a regular `dict`, it raises a `KeyError` exception. However, a `defaultdict` allows you to specify a default value type for keys that do not exist, eliminating the need to handle `KeyError` exceptions.**
```
# To use defaultdict, I have to import it first
from collections import defaultdict
	# define it like following
	groups = defaultdict(list)
	
	# append words into it
	groups.append(word)
		
	# print keys
	groups.keys()

	# print values
	groups.values()
```

#### sort a word in python
```
sorted_word = ''.join(sorted(word))
```

## Recursion
To make a recursive call, I need to have 3 things,
* Base case: When it will end calling or return something
```
            if(len(path) == len(nums)):
                result.append(path.copy())
                return result
```

* If the base case is an array then how I am appending and popping from the array
```
            for num in nums:
                if num not in path:
                    path.append(num)
                    backtrack(nums, path, result)
                    path.pop()
```

#### Diff between loops and recursion
Recursion involves defining a function that calls itself, creating a recursive chain of function calls. 
On the other hand, a for loop is a loop construct that iterates over a sequence of values or **performs a fixed number of iterations.**


## Permutation/Combinatorials:
For combinatorial problems or, recursive structure problems it's better to use backtracking or recursive solution. 
**If the problem size is relatively small and the time complexity requirement is not strict, backtracking can be a straightforward and intuitive approach. However, for larger problem sizes, backtracking might become inefficient. So, I have to use alternative approaches like dynamic programming or optimized iterative algorithms.**


[46. Permutations](https://leetcode.com/problems/permutations/description/)

Need to use backtrack to find the permutations, which is a recursive algorithm, this recursive algorithm must have a base case. 

## Subsets:
[78 subsets](https://leetcode.com/problems/subsets/)

To find subsets in an array,
```
		subsets = [[]]
		subsets += [subset + [num] for subset in subsets]
```
This is exactly like following,
```
		subsets = [[]]
		new_subset = []
		for subset in subsets:
			new_subset.append(subset + [num]) # It will add subset for the current num
		subsets.extend(new_subsets)  # It will add all those findings to the list of subsets 
```
***
If I add 2 list then it will concatenate,
	`[] + [1] = [1]`, it concatenates.
	`[1] + [2] = [1,2]`
***


## Binary Tree: 
[226. Invert Binary Tree](https://leetcode.com/problems/invert-binary-tree/)

In the array representation, if a node is at index i, 
	its left child will be at index `2*i+1`, and 
	its right child will be at index `2*i+2`. 
	Conversely, for a given node at index i, its parent will be at index `(i-1)//2`.

---
Binary tree is a structure that is generally defined like following,
```
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right
```
**Don't forget to use `self` if a function is defined in python.**

---

[104. Maximum Depth of Binary Tree](https://leetcode.com/problems/maximum-depth-of-binary-tree/)
Length of the longest path from the root node to any leaf node in the tree. 
To count the path, do following,
* If root is none, then return 0. 
* Traverse left and right subtree.
* Then add 1 to the max of left and right

[94. Binary Tree Inorder Traversal](https://leetcode.com/problems/binary-tree-inorder-traversal/description/)
Inorder traversal: left, root, right

![in-pre-post_order](pics/in-pre-post order.png "orders")

```
ans.extend(root.left)
ans.append(root.val)
ans.extend(root.right)
```
`extend` adds elements of the subtree but `append` adds the whole subtree into the list. In this case, if the root is none then I will return an empty list. 


[136. Single Number](https://leetcode.com/problems/single-number/description/)
To find the single number that appears only once in an array where every other element appears twice, you can use the XOR (exclusive OR) operation.

The XOR operation returns 1 if the corresponding bits of the two operands are different, and 0 if they are the same. Since XOR is commutative and associative, it means that if we XOR a number with itself, the result will be 0.

To find the single number, you can perform XOR on all the elements in the array. Since the duplicate numbers will cancel each other out (XORing them will result in 0), the remaining number will be the one that appears only once.


## BST (Binary Search Tree)
A BST, or Binary Search Tree, is a type of binary tree data structure that follows a specific ordering property. In a BST, for any given node, all the values in its left subtree are smaller than its value, and all the values in its right subtree are greater than its value.
Using the inorder traversal, I can visit the nodes in ascending order.
