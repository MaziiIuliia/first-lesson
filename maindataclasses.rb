# task 1
puts "task1"
string1 = '235'
v = 1
len = string1.length
sum = string1[0].to_i
while v < len
  sum += string1[v].to_i
  v += 1
end
puts sum

# task 2
puts "task2"
string2 = 'afsdf3432df23dj334'
array = string2.scan(/[0-999]+/)
puts array.max_by{ |elem| elem.size }.length


# task 3
puts "task3"
string2 = 'afsdf3432df23dj334'
array = string2.scan(/[0-999]+/)
puts array.max_by{ |elem| elem.size }


# task 4
puts "task4"
string3 = '1234gdgd'
string4 = '1234asasas'
array2 = []
n = 0
while string3[n] == string4[n]
  array2 << string3[n]
  n += 1
end
puts array2.length

# task 5
puts "task5"
array3 = [1,2,3,4,5,6,7,8,9]
array4 = []
array5 = []
a = 1
idx = array3.index(array3[-1])
while a <= idx
  if array3.index(array3[a]).odd?
    array4 << array3[a]
  elsif array3.index(array3[a]).even?
    array5 << array3[a]
  end
  a += 1
end
puts array4
puts array5


# task 6
puts "task6"
ary = [1,2,3,4,5,6,7,11,9]
ary2 = []
i = ary.index(ary[-2])
while ary2.empty? && i > 0
  if ary[i] > ary[0]  && ary[i] < ary[-1]
    ary2 << ary[i]
    puts i
  end
  i -= 1
end

# task 7
puts "task7"
ary3 = [1,2,3,4,5,6,7,8]
z = 1
l = ary3.length
while z < (l-1)
  if ary3[z].even?
    ary3[z] += ary3[0]
  end
  z += 1
end
puts ary3

# task 8
puts "task8"
hash = {'keyone' => 'value', 'keytwo' => 'value'}
hash.each_key {|key| key.to_i}
hash.each_value {|value| value.to_sym}
puts hash

# task 9
puts "task9"
hash2 = {symbol: 1, asymbol: 2, symb: 1, mbol: 2,}
ary4 = hash2.keys
ary4.map!{|el|el.to_s}
g = 0
h = ary4.length
while g < h
  str = ary4[g]
  if str[0] == 's'
    hash2.delete_if {|key, value| key == str.to_sym }
  end
  g += 1
end
puts hash2
