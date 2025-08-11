## What is Big O?
As your input grows, how fas does computation or memory grow?
> Important concept: Growth is with respect to the input

### O(n)
O(n) means that the computation grows linearly as the input grows.
A quick way to spot O(n) alghorithm is look for loops, like in the example below:

```rb
def sum_char_codes(n)
  sum = 0

  (0..(n.length - 1)).each do |i|
    sum += n[i].ord
  end

  sum
end
```

If the previous example is O(n), what about this new example, which has two loops?

```rb
def sum_char_codes(n)
  sum = 0

  (0..(n.length - 1)).each do |i|
    sum += n[i].ord
  end

  (0..(n.length - 1)).each do |i|
    sum += n[i].ord
  end

  sum
end
```

It is still O(n)! 
> Important concept: Constants are dropped
> Important concept: Big O tends to focus on worst case scenarios

In the example above, the alghorithm complexity is O(2n), but in big O notation we always drop constants.
That is because Big O described the upper bound of the alghorithm. Constant growth eventually becomes irrelevant.
Examples:

N = 1, O(10N) = 10, O(N^2) = 1
N = 5, O(10N) = 50, O(N^2) = 25
N = 100, O(10N) = 1,000, O(N^2) = 10,000 # 10x bigger
N = 1000, O(10N) = 10,000, O(N^2) = 1,000,000 # 100x bigger
N = 10000, O(10N) = 100,000, O(N^2) = 100,000,000 # 1000x bigger

### O(n^2)

```rb
def sum_char_codes(n)
  sum = 0

  (0..(n.length - 1)).each do |i|
    (0..(n.length - 1)).each do |j|
      sum += n[i].ord
    end
  end

  sum
end
```

### O(n^3)

```rb
def sum_char_codes(n)
  sum = 0

  (0..(n.length - 1)).each do |i|
    (0..(n.length - 1)).each do |j|
      (0..(n.length - 1)).each do |k|
        sum += n[i].ord
      end
    end
  end

  sum
end
```

### O(n log n)
An example is Quicksort alghorithm

### O(log n)
An example is Binary Search Trees

