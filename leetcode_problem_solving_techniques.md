# Top 100 liked questions

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
			new_subset.append(subset + [num]) //It will add subset for the current num
		subsets.extend(new_subsets) // It will add all those findings to the list of subsets
```

## Binary Tree: 
[226. Invert Binary Tree](https://leetcode.com/problems/invert-binary-tree/)

In the array representation, if a node is at index i, 
	its left child will be at index `2*i+1`, and 
	its right child will be at index `2*i+2`. 
	Conversely, for a given node at index i, its parent will be at index `(i-1)//2`.

***
Binary tree is a structure that is generally defined like following,
```
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right
```
**Don't forget to use `self` if a function is defined in python.**

[104. Maximum Depth of Binary Tree](https://leetcode.com/problems/maximum-depth-of-binary-tree/)

