(ns sublist)

(defn classify [list1 list2] ;; <- arglist goes here
      ;; your code goes here
  (every? (contains? list2) list1)
)

