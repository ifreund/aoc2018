(def input (string/split "\n" (string/trim (slurp "input/03.txt"))))

(def claim
  '{:val (<- :d+)
    :main (* "#" :val " @ " :val "," :val ": " :val "x" :val)})

(var claims @[])
(loop [line :in input]
  (def c (map scan-number (peg/match claim line)))
  (array/push claims @{:id (c 0)
                       :x (c 1) :y (c 2)
                       :w (c 3) :h (c 4)}))

(var fabric @{})
(loop [c :in claims
       x :range [(c :x) (+ (c :x) (c :w))]
       y :range [(c :y) (+ (c :y) (c :h))]]
  (update fabric {:x x :y y} |(if $ (inc $) 1)))

(var part1 0)
(each v fabric (if (>= v 2) (++ part1)))
(print "part 1: " part1)

(var part2 0)
(loop [c :in claims :while (= part2 0)]
  (var overlap false)
  (loop [x :range [(c :x) (+ (c :x) (c :w))]
         y :range [(c :y) (+ (c :y) (c :h))]
         :until overlap]
    (set overlap (> (fabric {:x x :y y}) 1)))
  (if (not overlap) (set part2 (c :id))))

(print "part 2: " part2)
