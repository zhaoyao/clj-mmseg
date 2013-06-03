(defproject clj-mmseg "0.1.0-SNAPSHOT"
  :description "clojure wrapper for mmseg4j"
  :url "http://github.com/zhaoyao/clj-mmseg"
  :license {:name "Eclipse Public License"
            :url "http://www.eclipse.org/legal/epl-v10.html"}
  :dependencies [[org.clojure/clojure "1.5.1"]
                 [mmseg4j "1.8.5"]]
  :repositories {"local" ~(str (.toURI (java.io.File. "lib")))})
