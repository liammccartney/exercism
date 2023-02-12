(ns accumulate)

(defn helper [lst f acc]
  (let [x (first lst)]
    (if x (helper (drop 1 lst) f (conj acc (f x))) acc)))

(defn accumulate [f lst] ;; <- arglist goes here
  (helper lst f '[]))
