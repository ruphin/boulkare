require 'set'

explored = Hash.new { |h,k| h[k] = Hash.new(&h.default_proc) }
o = true
x = false

MAP5= [x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,
       x,o,o,o,o,o,o,o,o,o,x,o,o,x,x,
       x,o,o,o,o,o,o,o,o,o,o,o,o,x,x,
       x,o,o,o,o,o,o,o,o,o,o,x,x,x,x,
       x,o,o,o,o,o,o,o,o,o,o,o,o,x,x,
       x,o,o,o,o,o,o,o,o,o,o,o,o,x,x,
       x,o,o,o,o,o,o,o,o,o,o,o,o,x,x,
       x,o,o,o,o,o,o,o,o,o,o,o,o,x,x,
       x,o,o,o,o,o,o,o,o,o,o,o,o,o,x,
       x,x,x,x,x,x,x,x,x,x,x,x,x,x,x]
MAP5WIDTH = 15
MAP5STATE = [MAP5WIDTH * 3 + 4, MAP5WIDTH * 8 + 10, Set[MAP5WIDTH * 3 + 8, MAP5WIDTH * 3 + 9, MAP5WIDTH * 4 + 6, MAP5WIDTH * 4 + 7], []]


MAP9= [x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,
       x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,o,o,x,
       x,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,x,x,
       x,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,x,x,
       x,x,x,x,o,o,o,o,o,o,o,o,o,o,o,o,x,x,
       x,x,o,o,o,o,o,o,o,o,o,o,o,o,o,o,x,x,
       x,x,o,o,o,o,o,o,o,o,o,o,o,o,o,o,x,x,
       x,x,o,o,o,o,o,o,o,o,o,o,o,o,o,o,x,x,
       x,x,o,o,o,o,o,o,o,o,o,o,o,o,o,o,x,x,
       x,x,o,o,o,o,o,o,o,o,o,o,o,o,o,o,x,x,
       x,x,o,o,o,o,o,o,o,o,o,o,o,o,o,o,x,x,
       x,x,o,o,o,o,o,o,o,o,o,o,o,o,x,o,x,x,
       x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,
       x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x]
MAP9WIDTH = 18
MAP9STATE = [MAP9WIDTH * 2 + 1, MAP9WIDTH * 11 + 15, Set[MAP9WIDTH * 2 + 4, MAP9WIDTH * 4 + 4, MAP9WIDTH * 5 + 4, MAP9WIDTH * 6 + 4], []]

MAP26=[x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,
       x,x,o,o,o,o,o,o,o,o,o,o,o,o,o,o,x,x,
       x,o,o,o,o,o,o,x,o,x,x,o,o,o,o,o,o,x,
       x,x,o,o,o,o,o,x,o,o,o,o,o,x,o,o,o,x,
       x,o,o,x,o,o,o,o,o,o,o,o,o,o,o,o,o,x,
       x,o,o,x,o,o,o,o,o,x,o,o,o,o,o,o,o,x,
       x,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,x,
       x,o,o,o,o,o,x,o,x,x,o,x,o,o,x,o,o,x,
       x,o,o,o,o,o,o,o,o,o,o,o,o,o,x,o,o,x,
       x,o,x,o,o,o,o,o,o,o,o,x,o,o,x,o,o,x,
       x,o,o,o,x,o,o,o,o,x,x,x,o,o,x,o,o,x,
       x,o,o,o,x,x,o,o,o,o,o,o,o,o,o,o,o,x,
       x,x,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,x,
       x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x]
MAP26WIDTH = 18
MAP26STATE = [MAP9WIDTH * 3 + 5, MAP9WIDTH * 7 + 15, Set[MAP9WIDTH * 3 + 8, MAP9WIDTH * 5 + 4, MAP9WIDTH * 5 + 10, MAP9WIDTH * 10 + 5], []]

MAP48=[x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,
       x,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,x,x,
       x,x,o,o,o,o,o,o,o,o,o,o,o,o,o,o,x,x,
       x,x,o,o,o,x,o,o,x,x,x,o,o,o,o,o,x,x,
       x,x,o,o,o,o,o,o,o,x,o,o,o,o,o,o,x,x,
       x,x,o,o,o,o,o,x,o,o,o,o,o,o,o,o,x,x,
       x,x,o,o,o,o,o,x,x,o,o,o,o,o,o,o,x,x,
       x,x,o,o,o,x,o,o,o,o,o,o,o,o,o,o,x,x,
       x,x,x,o,o,o,o,o,o,o,o,o,o,o,o,x,x,x,
       x,x,o,o,x,o,o,o,o,o,o,o,o,o,o,o,x,x,
       x,x,o,o,o,o,o,o,o,o,o,o,o,o,o,o,x,x,
       x,x,o,o,o,o,o,o,o,o,x,x,x,x,o,o,x,x,
       x,x,x,o,o,o,o,o,o,o,o,o,o,o,o,o,o,x,
       x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x]
MAP48WIDTH = 18
MAP48STATE = [MAP48WIDTH * 1 + 1, MAP48WIDTH * 12 + 16, Set[MAP48WIDTH * 4 + 8, MAP48WIDTH * 6 + 6, MAP48WIDTH * 8 + 8, MAP48WIDTH * 6 + 10], []]


WIDTH = MAP48WIDTH
map = MAP48
unexplored = [MAP48STATE]

def thing(map, explored, unexplored, state)
  explored[state[0]][state[1]][state[2]][0]
  ##### THINGY A
  targets = state[2]
  tmp = state[0]
  while map[tmp] && tmp != state[1] do
    if targets.include? tmp
      targets = targets - [tmp]
    end
    tmp -= 1
  end
  tmp += 1
  if targets.empty?
    puts state[3] + [:aleft]
    return true
  end
  if explored[[tmp, state[1]].min][[tmp, state[1]].max][targets].empty?
    unexplored.unshift([[tmp, state[1]].min ,[tmp, state[1]].max ,targets ,state[3] + [:aleft]])
  end

  targets = state[2]
  tmp = state[0]
  while map[tmp] && tmp != state[1] do
    if targets.include? tmp
      targets = targets - [tmp]
    end
    tmp += 1
  end
  tmp -= 1
  if targets.empty?
    puts state[3] + [:aright]
    return true
  end
  if explored[[tmp, state[1]].min][[tmp, state[1]].max][targets].empty?
    unexplored.unshift([[tmp, state[1]].min ,[tmp, state[1]].max ,targets ,state[3] + [:aright]])
  end

  targets = state[2]
  tmp = state[0]
  while map[tmp] && tmp != state[1] do
    if targets.include? tmp
      targets = targets - [tmp]
    end
    tmp -= WIDTH
  end
  tmp += WIDTH
  if targets.empty?
    puts state[3] + [:aup]
    return true
  end
  if explored[[tmp, state[1]].min][[tmp, state[1]].max][targets].empty?
    unexplored.unshift([[tmp, state[1]].min ,[tmp, state[1]].max ,targets ,state[3] + [:aup]])
  end

  targets = state[2]
  tmp = state[0]
  while map[tmp] && tmp != state[1] do
    if targets.include? tmp
      targets = targets - [tmp]
    end
    tmp += WIDTH
  end
  tmp -= WIDTH
  if targets.empty?
    puts state[3] + [:adown]
    return true
  end
  if explored[[tmp, state[1]].min][[tmp, state[1]].max][targets].empty?
    unexplored.unshift([[tmp, state[1]].min ,[tmp, state[1]].max ,targets ,state[3] + [:adown]])
  end

  ##### THINGY B
  targets = state[2]
  tmp = state[1]
  while map[tmp] && tmp != state[0] do
    if targets.include? tmp
      targets = targets - [tmp]
    end
    tmp -= 1
  end
  tmp += 1
  if targets.empty?
    puts state[3] + [:bleft]
    return true
  end
  if explored[[state[0], tmp].min][[state[0], tmp].max][targets].empty?
    unexplored.unshift([[state[0], tmp].min ,[state[0], tmp].max ,targets ,state[3] + [:bleft]])
  end

  targets = state[2]
  tmp = state[1]
  while map[tmp] && tmp != state[0] do
    if targets.include? tmp
      targets = targets - [tmp]
    end
    tmp += 1
  end
  tmp -= 1
  if targets.empty?
    puts state[3] + [:bright]
    return true
  end
  if explored[[state[0], tmp].min][[state[0], tmp].max][targets].empty?
    unexplored.unshift([[state[0], tmp].min ,[state[0], tmp].max ,targets ,state[3] + [:bright]])
  end

  targets = state[2]
  tmp = state[1]
  while map[tmp] && tmp != state[0] do
    if targets.include? tmp
      targets = targets - [tmp]
    end
    tmp -= WIDTH
  end
  tmp += WIDTH
  if targets.empty?
    puts state[3] + [:bup]
    return true
  end
  if explored[[state[0], tmp].min][[state[0], tmp].max][targets].empty?
    unexplored.unshift([[state[0], tmp].min ,[state[0], tmp].max ,targets ,state[3] + [:bup]])
  end

  targets = state[2]
  tmp = state[1]
  while map[tmp] && tmp != state[0] do
    if targets.include? tmp
      targets = targets - [tmp]
    end
    tmp += WIDTH
  end
  tmp -= WIDTH
  if targets.empty?
    puts state[3] + [:bdown]
    return true
  end
  if explored[[state[0], tmp].min][[state[0], tmp].max][targets].empty?
    unexplored.unshift([[state[0], tmp].min ,[state[0], tmp].max ,targets ,state[3] + [:bdown]])
  end
  # puts state[2].size
  return false
end

loop do
  break if thing(map, explored, unexplored, unexplored.pop)
end
