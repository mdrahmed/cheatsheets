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
