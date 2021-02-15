(def input
  (map scan-number
       (string/split "\n" (string/trim (slurp "input/01.txt")))))

(var freq 0)
(map |(+= freq $) input)
(print "part 1: " freq)

(set freq 0)
(def mem @{})

(def deltas
  (generate [_ :iterate true delta :in input] delta))

(loop [delta :in deltas :until (get mem freq)]
  (put mem freq true)
  (+= freq delta))

(print "part 2: " freq)
