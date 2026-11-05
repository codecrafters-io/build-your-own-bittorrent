(ns build
  (:gen-class)
  (:require [clojure.tools.build.api :as b]))

(def lib 'io.codecrafters.bittorrent)
(def class-dir "/tmp/codecrafters-build-bittorrent-clojure/classes")
(def basis (b/create-basis {:project "deps.edn"}))
(def uber-file "/tmp/codecrafters-build-bittorrent-clojure/target.jar")

(defn clean [_]
  (b/delete {:path "/tmp/codecrafters-build-bittorrent-clojure"}))

(defn uber [_]
  (clean nil)
  (b/copy-dir {:src-dirs ["src"] :target-dir class-dir})
  (b/compile-clj {:basis basis
                  :ns-compile '[bittorrent.core]
                  :class-dir class-dir})
  (b/uber {:class-dir class-dir
           :uber-file uber-file
           :basis basis
           :main 'bittorrent.core}))
