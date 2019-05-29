
def f(&p)
  puts 'enter f'
  p.call if block_given?
end

f { puts 'run block' } ## 'f2' 'block', 挂载了块作为参数&p传入,p是一个proc,可以用关键字 call 来执行

num_proc = proc { |num| puts "The number is #{num} " }
num_proc.call 10 # => The number is 10

p '----------------------------------------------------------------'
p 'proc, lambda区别之一 return'
p '  1.proc 相当于嵌入一段代码块，所以proc 中执行 return 会直接返回.'
p '  2.lambda 是匿名函数，所以lambda中执行return，外面的函数不会直接返回'

def run_a_proc(p)
  puts 'start...'
  p.call
  puts 'end.'
end

# the lambda will be ignore
def run_couple
  run_a_proc proc { puts 'I am a proc'; return }
  p 'you will not see me'
  run_a_proc lambda { puts 'I am a lambda'; return }
end

run_couple


p '----------------------------------------------------------------'
p '区别之二 参数校验'
p '  1.proc 不会执行参数校验，默认为nil'
p '  2.lambda 会执行参数校验'

hello_proc = proc do |a, b|
    puts 'hello proc'
end

p hello_proc
hello_proc.call


#lambda must be passed matched parameters
hello_lambda = lambda do |a, b|
  puts 'hello lambda'
end

p hello_lambda
hello_lambda.call 1, 2

begin
  hello_lambda.call# occure exception
rescue => e
  p e
end

p '----------------------------------------------------------------'
p '总结:'
p '  1.block 是代码块，只能一次调用'
p '  2.proc 将block实例化，可以随时调用; 检查参数; return 时直接返回;'
p '  3.lambda 是匿名方法，也是proc实例; 不检查参数; return 时只是从匿名方法内部返回'

