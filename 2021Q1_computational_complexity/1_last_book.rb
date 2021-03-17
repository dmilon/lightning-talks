require "benchmark"
require_relative "books_10_000"

def last_book(books)
  books.last
end

[10, 100, 1_000, 10_000].each do |n|
  books = BOOKS_10_000.first(n)
  time = Benchmark.measure { last_book(books) }.total
  puts "n: #{n}, time: #{time}"
end
