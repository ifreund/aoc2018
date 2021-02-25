(def input (string/split "\n" (string/trim (slurp "input/02.txt"))))

(var two 0)
(var three 0)

(loop [word :in input]
  (do
    (def freqs (frequencies word))
    (if (index-of 2 freqs) (++ two))
    (if (index-of 3 freqs) (++ three))))

(print "part 1: " (* two three))

(loop [i :range [0 (length input)]
       j :range [i (length input)]]
  (def w1 (input i))
  (def w2 (input j))
  (var diff 0)
  (var diff-k 0)
  (loop [k :range [0 (length w1)]]
    (if (not= (w1 k) (w2 k))
      (do
        (++ diff)
        (set diff-k k))))
  (if (= diff 1)
    (do
      (prin "part 2: " (string/slice w1 0 diff-k))
      (print (string/slice w1 (inc diff-k))))))
