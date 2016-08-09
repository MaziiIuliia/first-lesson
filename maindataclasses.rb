# task 1
string1 = '235'
sum = string1[0].to_i+string1[1].to_i+string1[2].to_i
puts sum

# task 2
string2 = 'afsdf3432df23dj334'
array = string2.scan(/[0-999]+/)
puts array.max_by{ |elem| elem.size }.length

# task 3
string2 = 'afsdf3432df23dj334'
array = string2.scan(/[0-999]+/)
puts array.max_by{ |elem| elem.size }

# task 4
string3 = '1234gdgd'
string4 = '1234asasas'
string5 = '1234gdgd'
array2 = []
n = 0
while string3[n] == string4[n]
  array2 << string3[n]
  n += 1
end
puts array2.length

# task 5
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
ary3 = [1,2,3,4,5,6,7,8]
z = 1
l = ary3.length
while z > 0 && z < (l-1)
  if ary3[z].even?
   ary3[z] += ary3[0]
  end
  z += 1
end
puts ary3

# task 8
hash = {'key1':'value1', 'key2':'value2'}
hash.each_pair do |key,value|
  puts hash.keys
end