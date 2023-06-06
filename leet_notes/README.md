# Using leet effectively
* [Solve Leet 100 like questions](https://leetcode.com/problem-list/top-100-liked-questions/?sorting=W3sic29ydE9yZGVyIjoiREVTQ0VORElORyIsIm9yZGVyQnkiOiJBQ19SQVRFIn1d)
* [Solve Blind 75]
* If there is a interview to attend then just [find company wise questions and solve those](https://github.com/mdrahmed/cheatsheets/blob/main/leet_notes/README.md#find-the-company-wise-interview-questions).
* Otherwise, find problems from google list(given from 1st google interview) and solve those

# Find the Company wise interview questions
* [All interview question Leetcode](https://leetcode.com/discuss/interview-question?currentPage=1&orderBy=hot&query=)
* [Here is all google OA questions](https://leetcode.com/discuss/interview-question?currentPage=1&orderBy=most_relevant&query=google)

# Leet 100 like questions solutions

[763. Partition Labels](https://leetcode.com/problems/partition-labels/)
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

[46. Permutations](https://leetcode.com/problems/permutations/description/)
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

[78. Subsets](https://leetcode.com/problems/subsets/)
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

[226. Invert Binary Tree](https://leetcode.com/problems/invert-binary-tree/)
```
        if root is None:
            return None
        
        root.left, root.right = root.right, root.left

        self.invertTree(root.left)
        self.invertTree(root.right)

        return root
```

[104. Maximum Depth of Binary Tree](https://leetcode.com/problems/maximum-depth-of-binary-tree/)
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

[94. Binary Tree Inorder Traversal](https://leetcode.com/problems/binary-tree-inorder-traversal/description/)
```
        ans = []

        if root is None:
            return []

        ans.extend(self.inorderTraversal(root.left))
        ans.append(root.val)
        ans.extend(self.inorderTraversal(root.right))

        return ans
```

[22. Generate Parentheses](https://leetcode.com/problems/generate-parentheses/)
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

[48. Rotate Image](https://leetcode.com/problems/rotate-image/)
```
        n = len(matrix)

        for i in range(n):
            for j in range(i,n):
                matrix[i][j],matrix[j][i] = matrix[j][i],matrix[i][j]
        
        for i in range(n):
            matrix[i] = matrix[i][::-1]
```

[118. Pascal's Triangle](https://leetcode.com/problems/pascals-triangle/description/)
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


[136. Single Number](https://leetcode.com/problems/single-number/description/)
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

[230. Kth Smallest Element in a BST](https://leetcode.com/problems/kth-smallest-element-in-a-bst/description/)
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

[39. Combination Sum](https://leetcode.com/problems/combination-sum/description/)
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

[49. Group Anagrams](https://leetcode.com/problems/group-anagrams/description/)
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
[2273. Find Resultant Array After Removing Anagrams](https://leetcode.com/problems/find-resultant-array-after-removing-anagrams/)
```
        def isAnagram(word1, word2):
            return sorted(word1) == sorted(word2)
        result = []
        for word in words:
            if len(result) == 0 or not isAnagram(word, result[-1]):
                result.append(word)
        return result
```
