(def input
  (map scan-number
       (string/split "\n" (string/trim (slurp "input/01.txt")))))

(var freq 0)
(map (fn [x] (+= freq x)) input)
(print "part 1: " freq)

(set freq 0)
(def mem @{})

(def deltas
  (generate [_ :iterate true
             delta :in input] delta))

(loop [delta :in deltas
       :while (if (nil? (get mem freq))
                (do (put mem freq true) true)
                (do (print "part 2: " freq) false))]
  (+= freq delta))
