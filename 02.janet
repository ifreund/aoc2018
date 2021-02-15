(def input (string/split "\n" (string/trim (slurp "input/02.txt"))))

(var two 0)
(var three 0)

(loop [word :in input]
  (do
    (def freqs (frequencies word))
    (if (index-of 2 freqs) (++ two))
    (if (index-of 3 freqs) (++ three))))

(print "part 1: " (* two three))
