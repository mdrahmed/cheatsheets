# Using leet effectively
* [Solve Leet 100 like questions](https://leetcode.com/problem-list/top-100-liked-questions/?sorting=W3sic29ydE9yZGVyIjoiREVTQ0VORElORyIsIm9yZGVyQnkiOiJBQ19SQVRFIn1d)
* [Solve Blind 75]
* If there is a interview to attend then just [find company wise questions and solve those](https://github.com/mdrahmed/cheatsheets/blob/main/leet_notes/README.md#find-the-company-wise-interview-questions).
* Otherwise, find problems from google list(given from 1st google interview) and solve those

# Find the Company wise interview questions
* [All interview question Leetcode](https://leetcode.com/discuss/interview-question?currentPage=1&orderBy=hot&query=)
* [Here is all google OA questions](https://leetcode.com/discuss/interview-question?currentPage=1&orderBy=most_relevant&query=google)

# Leet 100 like questions solutions

### [763. Partition Labels](https://leetcode.com/problems/partition-labels/)
The code is finding the lengths of contiguous substrings in s that contain unique characters. It uses the technique of maintaining a last dictionary to store the last occurrence index of each character encountered. By iterating over s and updating the end index to the maximum last occurrence index, it identifies the end of each unique substring. When the current index matches the end index, it calculates the length of the substring and appends it to the ans list. Finally, it returns the list of substring lengths.
**Keep track of last char**
```
	ans = []
        last = {c: i for i, c in enumerate(s)}
        end = st = 0
        for i,c in enumerate(s):
            end = max(end, last[c])
            if i == end:
                ans.append(i-st+1)
                st = i+1
        return ans
```

### [46. Permutations](https://leetcode.com/problems/permutations/description/)
The code uses the backtracking technique to generate all possible permutations of the given nums array. It starts with an empty path and gradually adds elements to it, ensuring that each element is unique within the current path. When the path length reaches the length of nums, it adds a copy of the path to the result list. By recursively exploring all possible choices at each step, it generates all permutations. Looping is used to iterate over the elements of nums and check if an element is already present in the path before adding it.
**backtrack pop append**
```
        def backtrack(nums, path, result):
            if(len(path) == len(nums)):
                result.append(path.copy())
                return result
            
            for num in nums:
                if num not in path:
                    # path.append(num)
                    # backtrack(nums, path, result)
                    # path.pop()
                    new_path = path + [num]
                    backtrack(nums, new_path, result)
            
        result = []
        backtrack(nums, [], result)
        return result
```
Alternative:
```
        ans = []
        def get_permute(list):
            # print(list)
            if len(list) == len(nums):
                ans.append(list.copy())
                return
            else:
                for x in nums:
                    if x not in list:
                        list.append(x)
                        get_permute(list)
                        list.pop()
        
        get_permute([])
        return ans
```

### [78. Subsets](https://leetcode.com/problems/subsets/)
The code generates all possible subsets of the given nums array using the iterative approach. It initializes subsets with an empty subset and then iteratively generates new subsets by adding the current number to each existing subset. By utilizing list comprehension, it creates new subsets by appending the current number to each existing subset, and then extends the subsets list with these new subsets.
**loop + 2 di-array**
```
        def find_subsets(nums):
            subsets = [[]]

            for num in nums:
                subsets += [subset + [num] for subset in subsets]
                # new_subsets = []
                # for subset in subsets:
                #     new_subsets.append(subset + [num])
                # subsets.extend(new_subsets)
            return subsets

        result = find_subsets(nums)
        return result
```

### [226. Invert Binary Tree](https://leetcode.com/problems/invert-binary-tree/)
__left, right to right, left__
```
        if root is None:
            return None
        
        root.left, root.right = root.right, root.left

        self.invertTree(root.left)
        self.invertTree(root.right)

        return root
```

### [104. Maximum Depth of Binary Tree](https://leetcode.com/problems/maximum-depth-of-binary-tree/)
**left then right, max+1**
```
        if root is None:
            return 0

        leftDepth = self.maxDepth(root.left)
        rightDepth = self.maxDepth(root.right)

        return max(leftDepth, rightDepth) + 1
```

Alternative:
```
        if not root:
            return 0
        return 1+max(self.maxDepth(root.left),self.maxDepth(root.right))
```

### [94. Binary Tree Inorder Traversal](https://leetcode.com/problems/binary-tree-inorder-traversal/description/)
__left,root,right__
```
        ans = []

        if root is None:
            return []

        ans.extend(self.inorderTraversal(root.left))
        ans.append(root.val)
        ans.extend(self.inorderTraversal(root.right))

        return ans
```

### [22. Generate Parentheses](https://leetcode.com/problems/generate-parentheses/)
**backtrack, open then close**
```
        def backtrack(ans, curr, open_count, close_count):
            if len(curr) == 2 * n:  # Base case: the current combination is complete
                ans.append(curr)
                return

            if open_count < n:  # If the number of open parentheses is less than n, we can add an opening parenthesis
                backtrack(ans, curr + "(", open_count + 1, close_count)

            if close_count < open_count:  # If the number of closing parentheses is less than the number of open parentheses, we can add a closing parenthesis
                backtrack(ans, curr + ")", open_count, close_count + 1)

        result = []
        backtrack(result, "", 0, 0)  # Start the backtracking process
        return result
```

### [48. Rotate Image](https://leetcode.com/problems/rotate-image/)
__i,j to j,i and then rotate [i][::-1]__
```
        n = len(matrix)

        for i in range(n):
            for j in range(i,n):
                matrix[i][j],matrix[j][i] = matrix[j][i],matrix[i][j]
        
        for i in range(n):
            matrix[i] = matrix[i][::-1]
```

### [118. Pascal's Triangle](https://leetcode.com/problems/pascals-triangle/description/)
__[i-1][j-1] + [i-1][j]__
```
        triangle = []
        for i in range(numRows):
            row = []
            for j in range(i + 1):
                if j == 0 or j == i:
                    row.append(1)
                else:
                    row.append(triangle[i - 1][j - 1] + triangle[i - 1][j])
            triangle.append(row)
            
        return triangle
```
#### Similar question to `118. Pascal's Triangle`
-[119. Pascal's Triangle II](https://leetcode.com/problems/pascals-triangle-ii/description/)
**Done by me**
```
        triangle = []
        for i in range(rowIndex+1):
            row = []
            for j in range(i+1):
                if j==0 or j==i:
                    row.append(1)
                else:
                    row.append(triangle[i-1][j-1] + triangle[i-1][j])
            triangle.append(row)
        return row
```
*1 More*


### [136. Single Number](https://leetcode.com/problems/single-number/description/)
**XOR returns 1 if corresponding 2 bits are different. XOR a number with itself it will return 0**
```
        result = 0
        for num in nums:
            result ^= num
        return result
```
#### Similar questions to `136. Single Number`

-[137. Single Number II](https://leetcode.com/problems/single-number-ii/description/)
**Done by me**
```
        hp = {}
        for num in nums:
            if num in hp:
                hp[num] += 1
            else:
                hp[num] = 1
            
        for k in hp:
            if hp[k] == 1:
                ans = k
        
        return ans
```
-[260. Single Number III](https://leetcode.com/problems/single-number-iii/description/)
**Done by me**
```
        hp = {}
        for num in nums:
            if num in hp:
                hp[num] += 1
            else:
                hp[num] = 1
        ans = []
        for k in hp:
            if hp[k] == 1:
                ans.append(k)
        return ans
```
-[268. Missing Number](https://leetcode.com/problems/missing-number/description/)
**Done by me**
```
        n = len(nums)
        summ = (n * (n+1))//2
        missing_sum = 0
        for num in nums:
            missing_sum += num
        print(summ)
        print(missing_sum)
        return summ-missing_sum
```
-[287. Find the Duplicate Number](https://leetcode.com/problems/find-the-duplicate-number/description/)
**Done by me**
```
        hp = {}
        for num in nums:
            if num in hp:
                hp[num] += 1
            else:
                hp[num] = 1
            
        for key in hp:
            if hp[key] > 1:
                return key
```
_1 more_

### [230. Kth Smallest Element in a BST](https://leetcode.com/problems/kth-smallest-element-in-a-bst/description/)
__The elements are sorted in inorder traversal in BST.__Do inorder and count to k
```
        self.count = 0
        self.result = None

        def inorder(node):
            if node is None or self.count >= k:
                return
            
            inorder(node.left)
            self.count += 1
            if self.count == k:
                self.result = node.val
                return
            inorder(node.right)

        inorder(root)
        return self.result

[Note: In here, I am using `self.count` and `self.result` because I am trying to modify this within another function. And as it is a local variable and not a mutable object like list, dict, set, bytearrays. If it's a mutable object then I could use it e.g., if it was a list then I will only be accessing and appending the values into it, so, at that time it's possible to call it without making it nonlocal or `self`. I can't modify it without making it nonlocal. I can make it nonlocal using the keyword `nonlocal count, result` inside `inorder` function or just simply use the `self` to access and modify this]
```

### [39. Combination Sum](https://leetcode.com/problems/combination-sum/description/)
**backtrack => determine base case, append and pop**
```
	result = []
        def backtrack(start, path, current_sum):
            if current_sum == target:
                result.append(path[:])
                return
            if current_sum > target:
                return
            
            for i in range(start, len(candidates)):
                path.append(candidates[i])
                backtrack(i, path, current_sum + candidates[i])
                path.pop()
        
        backtrack(0, [], 0)
        return result
```
TC: `O(2^n * n)`

__Alternate Approach (DP):__
__dp is all about storing all the values in their array after specific calculation__
```
        dp = [[] for _ in range(target + 1)]
    
        # Base case: there is one way to make 0, which is an empty combination
        dp[0].append([])
        
        # Iterate through all candidates
        for candidate in candidates:
            # For each candidate, iterate from the candidate value up to the target
            for i in range(candidate, target + 1):
                # For each sum i, iterate through all combinations that can lead to this sum
                for combination in dp[i - candidate]:
                    # Append the current candidate to each combination to form new combinations
                    new_combination = combination + [candidate]
                    dp[i].append(new_combination)
        
        return dp[target]
```
TC: `O(target * n * m)`, where n is the number of candidates and m is the average length of the combinations. 

### [49. Group Anagrams](https://leetcode.com/problems/group-anagrams/description/)
__sort the word => ''.join(sorted(word)). Use defaultdict because that will initiate 0 if that value is not defined before__
```
        groups = defaultdict(list)

        for word in strs:
            sorted_word = ''.join(sorted(word))
            groups[sorted_word].append(word)
        
        return groups.values()
```
TC: O(n * m * log m)
1. Iterating through the strs list: O(n)
2. Sorting each word: O(m * log m)
3. Accessing and appending to the groups dictionary: O(1)

The time complexity of sorting a word is O(m * log m) because sorting a string of length m requires comparing and rearranging the characters, which has a complexity of O(m * log m) using efficient sorting algorithms like Timsort (used by Python's `sorted` function)

__Alternate approach (using regular python dict):__
```
        groups = {}

        for word in strs:
            sorted_word = ''.join(sorted(word))
            if sorted_word in groups.keys():
                groups[sorted_word].append(word)
            else:
                groups[sorted_word] = [word]
            
        return groups.values()
```
TC: O(n * m * log m)

#### Similar question to `49. Group Anagrams`
-[2273. Find Resultant Array After Removing Anagrams](https://leetcode.com/problems/find-resultant-array-after-removing-anagrams/)
```
        def isAnagram(word1, word2):
            return sorted(word1) == sorted(word2)
        result = []
        for word in words:
            if len(result) == 0 or not isAnagram(word, result[-1]):
                result.append(word)
        return result
```

### [215. Kth Largest Element in an Array](https://leetcode.com/problems/kth-largest-element-in-an-array/description/)
__Algorithm used: quickselect__
```
import random
        def partition(left, right, pivot_idx):
            pivot = nums[pivot_idx]
            # Move pivot to the rightmost position
            nums[pivot_idx], nums[right] = nums[right], nums[pivot_idx]
            # Perform partitioning
            store_idx = left
            for i in range(left, right):
                if nums[i] < pivot:
                    nums[i], nums[store_idx] = nums[store_idx], nums[i]
                    store_idx += 1
            # Move pivot back to its sorted position
            nums[store_idx], nums[right] = nums[right], nums[store_idx]
            return store_idx

        def quickselect(left, right, k_smallest):
            if left == right:
                return nums[left]
            
            # Choose a random pivot index
            pivot_idx = random.randint(left, right)
            
            # Perform partitioning and get the updated pivot index
            pivot_idx = partition(left, right, pivot_idx)
            
            # If the pivot is the k-th largest element, return it
            if k_smallest == pivot_idx:
                return nums[k_smallest]
            # If the k-th largest element is in the left subarray, recursively call quickselect on the left subarray
            elif k_smallest < pivot_idx:
                return quickselect(left, pivot_idx - 1, k_smallest)
            # If the k-th largest element is in the right subarray, recursively call quickselect on the right subarray
            else:
                return quickselect(pivot_idx + 1, right, k_smallest)

        # Convert k to the k-th smallest index
        k_smallest = len(nums) - k
        
        # Call quickselect to find the k-th largest element
        return quickselect(0, len(nums) - 1, k_smallest)
```
