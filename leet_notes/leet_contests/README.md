## Weekly Contest 353
### [2769. Find the Maximum Achievable Number](https://leetcode.com/contest/weekly-contest-353/problems/find-the-maximum-achievable-number/)
```
    def theMaximumAchievableX(self, num: int, t: int) -> int:
            return num + (t*2)
```

### [2770. Maximum Number of Jumps to Reach the Last Index](https://leetcode.com/contest/weekly-contest-353/problems/maximum-number-of-jumps-to-reach-the-last-index/)
```
    def maximumJumps(self, nums: List[int], target: int) -> int:
        n = len(nums)
        dp = [float('-inf')] * n
        dp[0] = 0

        for i in range(1, n):
            for j in range(i):
                if abs(nums[i] - nums[j]) <= target:
                    dp[i] = max(dp[i], dp[j] + 1)

        if dp[n-1] == float('-inf'):
            return -1
        else:
            return dp[n-1]
```


## Weekly Contest 352
### [2760. Longest Even Odd Subarray With Threshold](https://leetcode.com/contest/weekly-contest-352/problems/longest-even-odd-subarray-with-threshold/)
```
    def longestAlternatingSubarray(self, nums: List[int], threshold: int) -> int:
        n = len(nums)
        left = right = max_length = 0
        
        while left < n:
            if nums[left]%2 == 0 and nums[left] <= threshold:
                right = left
                while right < n-1:
                    if nums[right]%2 == nums[right+1]%2 or nums[right+1] > threshold:
                        break;
                    right += 1
                max_length = max(max_length,right-left+1)
            left += 1
        return max_length
```
### [2761. Prime Pairs With Target Sum](https://leetcode.com/contest/weekly-contest-352/problems/prime-pairs-with-target-sum/)
```
        prime = [True for i in range(num+1)]
        p = 2
        while (p * p <= num):
            if (prime[p] == True):
                for i in range(p * p, num+1, p):
                    prime[i] = False
            p += 1
        ans = []
        for i in range(2,num//2+1):
            j = num-i
            if prime[i] and prime[j]:
                ans.append([i,j])
        return ans
```

## Weekly Contest 351
### [2748. Number of Beautiful Pairs](https://leetcode.com/contest/weekly-contest-351/problems/number-of-beautiful-pairs/)
```
    def countBeautifulPairs(self, nums: List[int]) -> int:
        res = 0
        def first_digit(num):
            str_num = str(num)
            return int(str_num[0])
        def last_digit(num):
            str_num = str(num)
            return int(str_num[-1])
        
        for i in range(len(nums)):
            for j in range(i+1, len(nums)):
                fst = first_digit(nums[i])
                snd = last_digit(nums[j])
                if math.gcd(fst,snd) == 1:
                    # print(nums[i],nums[j],math.gcd(nums[i], nums[j]))
                    res += 1
        return res
```
### [2749. Minimum Operations to Make the Integer Zero](https://leetcode.com/contest/weekly-contest-351/problems/minimum-operations-to-make-the-integer-zero/)
```
# not done yet
```

## Weekly Contest 350
### [2739. Total Distance Traveled](https://leetcode.com/contest/weekly-contest-350/problems/total-distance-traveled/)
```
    def distanceTraveled(self, mainTank: int, additionalTank: int) -> int:
        ans = 0
        while mainTank > 0:
            if mainTank >= 5:
                ans += 5
                if additionalTank > 0:
                    mainTank += 1
                    additionalTank -= 1
                mainTank -= 5
            else:
                ans += mainTank
                mainTank -= mainTank
        return ans*10
```
### [2740. Find the Value of the Partition](https://leetcode.com/contest/weekly-contest-350/problems/find-the-value-of-the-partition/)
```
    def findValueOfPartition(self, nums: List[int]) -> int:
        print(nums)
        nums.sort()
        print(nums)
        n = len(nums)
        diff = 1000000000
        for i in range(1,n):
            if nums[i]-nums[i-1] <  diff:
                diff = nums[i]-nums[i-1]
        return diff
```

