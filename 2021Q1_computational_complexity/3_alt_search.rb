require "benchmark"
require_relative "books_10_000"

def alt_search(sorted_books, book_to_find)
  from = 0
  to = sorted_books.length - 1
  while from <= to
    pivot = (from + to) / 2
    if book_to_find > sorted_books[pivot]
      from = pivot + 1
    elsif book_to_find < sorted_books[pivot]
      to = pivot - 1
    else
      return pivot
    end
  end
  nil
end

[10, 100, 1000, 10_000].each do |n|
  books = BOOKS_10_000.sort.first(n)
  time = Benchmark.measure { alt_search(books, books.last) }.total
  puts "n: #{n}, time: #{time}, time/log(n): #{time / Math.log(n)}"
end
