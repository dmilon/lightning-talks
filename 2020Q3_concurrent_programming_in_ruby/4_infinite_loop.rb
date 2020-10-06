# lscpu

def infinite_loop
  i = 0
  while true
    i += 1
  end
end

thread_1 = Thread.new { infinite_loop }
thread_2 = Thread.new { infinite_loop }
thread_3 = Thread.new { infinite_loop }

thread_1.join
thread_2.join
thread_3.join
