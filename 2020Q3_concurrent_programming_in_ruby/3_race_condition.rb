n = 10_000_000
sum = 0
mutex = Mutex.new

threads = 10.times.map do |j|
  Thread.new do
    mutex.synchronize do
      (n / 10).times do
        new_sum = sum + 1
        puts "#{new_sum}" if new_sum % 1_000_000 == 0
        sum = new_sum
      end
    end
  end
end

threads.each &:join

puts "sum = #{sum}"
puts "The result is #{sum == n ? "correct" : "not correct"}"
