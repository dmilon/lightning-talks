require "benchmark"
require_relative "books_10_000"

def sort(books)
  n = books.length
  loop do
    swap = false
    (0..n - 2).each do |i|
      if books[i] > books[i + 1]
        books[i], books[i + 1] = books[i + 1], books[i]
        swap = true
      end
    end
    break unless swap
  end
  books
end

[10, 100, 1000, 10_000].each do |n|
  books = BOOKS_10_000.first(n).sort.reverse
  time = Benchmark.measure { sort(books) }.total
  puts "n: #{n}, time: #{time}, time/n^2: #{time / n**2}"
end
