require 'benchmark'

Benchmark.bm do |b|
  b.report "sequential:" do
    sleep 2
  end


  b.report "2-threaded:" do
    t1 = Thread.new do
      sleep 1
    end
    t2 = Thread.new do
      sleep 1
    end
    t1.join
    t2.join
  end

  b.report "10-threaded:" do
    threads = 10.times.map do
      Thread.new do
        sleep 1
      end
    end
    threads.each &:join
  end
end
