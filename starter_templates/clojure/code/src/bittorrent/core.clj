(ns bittorrent.core
  (:require [clojure.data.json :as json]
            [clojure.string :as str])
  (:gen-class))

;; Examples:
;;
;; - (decode-bencode "5:hello") -> "hello"
;; - (decode-bencode "10:hello12345") -> "hello12345"
(defn decode-bencode [bencoded-value]
  (if (Character/isDigit (first bencoded-value))
    (let [colon-index (str/index-of bencoded-value ":")
          length (parse-long (subs bencoded-value 0 colon-index))]
      (subs bencoded-value (inc colon-index) (+ (inc colon-index) length)))
    (throw (ex-info "Only strings are supported at the moment" {}))))

(defn -main [& args]
  ;; You can use print statements as follows for debugging, they'll be visible when running tests.
  (binding [*out* *err*]
    (println "Logs from your program will appear here!"))

  (let [[command bencoded-value] args]
    (if (= command "decode")
      (do
        ;; TODO: Uncomment the code below to pass the first stage
        ;; (println (json/write-str (decode-bencode bencoded-value)))
        )
      (println "Unknown command:" command))))
