(def input (map scan-number
             (string/split "\n" (string/trim (slurp "input/01.txt")))))

(var freq 0)
(map (fn [x] (+= freq x)) input)
(print "part 1: " freq)


