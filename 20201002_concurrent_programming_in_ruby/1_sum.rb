require 'benchmark'

n = 10_000_000
sum = 0

Benchmark.bm do |b|
  b.report "sequential:" do
    n.times { sum += 1 }
  end


  b.report "2-threaded:" do
    t1 = Thread.new do
      (n / 2).times { sum += 1 }
    end
    t2 = Thread.new do
      (n / 2 ).times { sum += 1 }
    end
    t1.join
    t2.join
  end

  b.report "10-threaded:" do
    threads = 10.times.map do
      Thread.new do
        (n / 10).times { sum += 1 }
      end
    end
    threads.each &:join
  end
end

puts "sum = #{sum}"
puts "The result is #{sum == n ? "correct" : "not correct"}"

