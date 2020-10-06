require 'benchmark'

def fib(n)
  n < 2 ? n : fib(n - 1) + fib(n - 2)
end

puts Benchmark.measure {
  4.times.map {
    Thread.new { fib(38) }
    }.each { |t| p t.value }
}

puts Benchmark.measure {
  4.times.map {
    Ractor.new { fib(38) }
    }.each { |r| p r.take }
}
