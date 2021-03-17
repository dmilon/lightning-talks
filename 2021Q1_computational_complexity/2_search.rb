require "benchmark"
require_relative "books_10_000"

def search(books, book_to_find)
  books.each_with_index do |book, index|
    return index if book == book_to_find
  end
  nil
end

[10, 100, 1_000, 10_000].each do |n|
  books = BOOKS_10_000.first(n)
  time = Benchmark.measure { search(books, books.last) }.total
  puts "n: #{n}, time: #{time}, time/n: #{time / n}"
end
