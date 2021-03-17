require "benchmark"
require_relative "books_10_000"

def alt_sort(books)
  return books if books.length <= 1

  pivot = books.delete_at(rand(books.length))

  left = []
  right = []

  books.each do |x|
    if x <= pivot
      left << x
    else
      right << x
    end
  end

  return *alt_sort(left), pivot, *alt_sort(right)
end

[10, 100, 1_000, 10_000].each do |n|
  books = BOOKS_10_000.first(n).sort.reverse
  time = Benchmark.measure { alt_sort(books) }.total
  puts "n: #{n}, time: #{time}, time/n^2: #{time / n**2}"
end
