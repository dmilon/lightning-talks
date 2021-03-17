<style>
img[alt~="center"] {
  display: block;
  margin: 0 auto;
}
</style>

# Computational Complexity

![center](https://imgs.xkcd.com/comics/travelling_salesman_problem.png)
[joke link](https://xkcd.com/399/)

---

## What is computational complexity?

- Analysis of the amount of resources required for an algorithm to perform a task
- It's not about what or how, it's about how much :money:
- Time complexity => use of CPU
- Space complexity => use of RAM
- How does my algorithm scale when given more data?
- Scenarii: best, average, worst => depend of the analysis (know data distribution or not)

---

## What is time complexity?

- Go from CPU to Big-O Notation
- Express the time taken to perform a task as a function of the input size
- f(n) = n^3
- f(n) = n^3 + n^2
- f(n) = n^3 - 8n^2 + 20n
- Draw the table for n from 1 to 1 000 000
- O(n^3)
- O(1) cf picture
- Put a chart of the plotted graph

---

## How to do the runtime analysis?

- Use code to plot in terminal
- Example with O(1) assignment
- Example with O(n) search
- Example with O(log n) binary search binary search is better than linear search but input has to be sorted
- Example with O(n^2) matrix calculus (data science) or bubble sort
- quick sort is n^2 at worst but n log n average so better when we don't know the input pattern

- What is python/ruby find complexity? n
- What is python/ruby sort complexity? n log n

---

## Conclusion

- Runtime analysis is not about algorithm right or wrong but how much
- Algorithm speed isn’t discussed in actual runtime but Big O Notation.
- != scenarii dependent of data structure
- Some algorithms are rabbit, other are turtles, depending of the size of n

---

## References

https://www.youtube.com/watch?v=YoZPTyGL2IQ

___


## Thank you!

___

## How a web server is working?
![center](https://res.cloudinary.com/deglbcocc/image/upload/v1601583137/Screenshot_from_2020-10-01_22-05-07.png)
___

## How a web server is REALLY working?
![center](https://res.cloudinary.com/deglbcocc/image/upload/v1601583304/Screenshot_from_2020-10-01_22-14-21.png)
___

# What is concurrency?
___

## Let's take a metaphor...
___

## ... a Restaurant 👨‍🍳
![center](https://res.cloudinary.com/deglbcocc/image/upload/v1601586121/Screenshot_from_2020-10-01_23-01-48.png)
___

## Asynchronicity
![center](https://res.cloudinary.com/deglbcocc/image/upload/v1601586097/Screenshot_from_2020-10-01_23-01-00.png)
___

## Multi-processing
![center](https://res.cloudinary.com/deglbcocc/image/upload/v1601586097/Screenshot_from_2020-10-01_22-59-39.png)
___

## Multi-threading
![center](https://res.cloudinary.com/deglbcocc/image/upload/v1601586097/Screenshot_from_2020-10-01_22-58-08.png)
___

## Parallelism
![center](https://res.cloudinary.com/deglbcocc/image/upload/v1601586097/Screenshot_from_2020-10-01_22-57-52.png)
___

## Takeaways about concurrency
- A program is concurrent when various code sequences run simultaneously
- Concurrency != parallelism
  - A program is parallel when you have multiple CPUs
  - Concurrency is about **dealing with** lots of things at once
  - Parallelism is about **doing** lots of things at once
- There are various implementations of concurrency: multi-threading is one of them
___

## Takeaways about multi-threading
- A process is a running instance of a program
- A thread is a sequence of instructions inside a process
- All threads inside a process share resources such as some memory
- Sharing resources makes it lighter than multi-processing
- But it can leads to thread nightmares 😴😱
___

# Multi-threading in Ruby
___

## Our first multi-threaded program: count from 1 to n
___

## Takeaways
- All threads terminate when the `main` thread terminates
- More threads **doesn't always** lead to more speed
- More threads **can** lead to more speed, especially if they have to wait (I/O)
- When there is I/O you can enter in the rabbit hole of:
  - Race conditions
  - Deadlocks
  - Starvations
  - ...
___

## I have multiple CPUs
## Is Ruby concurrent or parallel? 🤔
___

## Ruby Global Interpreter Lock
![center](https://res.cloudinary.com/deglbcocc/image/upload/v1601625110/Screenshot_from_2020-10-02_09-51-21.png)
___

##
![center](https://media.giphy.com/media/xT1XGO2o6wWPt7d8ju/giphy.gif)
___

## The GIL is our friend...
- It increases speed of single-threaded programs
- It prevents thread nightmares by executing only one Ruby thread at a time
- It protects Ruby MRI which relies on C libraries which are not always thread-safe

## ... but recently, it became a bulky friend
- It prevents us to run our programs in parallel and use our full CPU capacity
- It slows down multi-thread programs with few I/O
- It's only present in MRI implementation (cRuby) and not in jRuby for example
___

# Ruby 3: to parallelism and beyond!
![center](https://media.giphy.com/media/OTE39u2vQaL2U/giphy.gif)
___

## Actor design pattern
- An actor is like a thread which doesn't share memory with the other threads
- Actors don't communicate by sharing state
- They share states by communicating to each other
___

## Ractor: Ruby implementation of the Actor design pattern
- Multiple running Ractors in an interpreter process
- Limited object sharing
- Two-types communication between Ractors
- Copy & Move semantics to send message
___

## Our first multi-ractored program: Fibonacci sequence
___

# What is the link with RoR web development?
___

## We already use concurrent programming everyday: `puma`
___

## We already use concurrent programming everyday: `sidekiq`
___

## Conclusion
- Concurrent programming is something we all use, without thinking about it mostly
- Ruby is already tooled for multi-threaded concurrent programming
- But not (yet) for parallel programming
- The implementation of Ractor in Ruby 3 is a hot topic
- Its future use in puma or sidekiq could be a big lever to improve scalability of Ruby on Rails web applications

___

## References
- [Multithreading Code - Computerphile](https://www.youtube.com/watch?v=7ENFeb-J75k)
- [Restaurant, Kitchen, and Cook Analogy](https://medium.com/@martinjung03/concurrent-requests-handling-for-web-server-1-restaurant-kitchen-and-cook-analogy-17c676f8ab3e)
- [Nickel City Ruby 2014- Concurrency for !Dummies (Who Don't Get It (...Yet))](https://www.youtube.com/watch?v=crOJlbdeVJM)
- [Ractor report / Koichi Sasada](https://www.youtube.com/watch?v=40t8EPpnujg)
- [Ractor: a proposal for new concurrent abstraction without thread-safety issues](https://github.com/ruby/ruby/pull/3365)
___

# Thank you!
