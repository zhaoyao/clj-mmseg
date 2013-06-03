(ns clj-mmseg.core
  (:import [com.chenlb.mmseg4j Dictionary
                               SimpleSeg
                               ComplexSeg
                               MaxWordSeg
                               MMSeg]))

(defn- lazy-tokenize
  [^MMSeg mmseg]
  (let [word (.next mmseg)]
    (if (nil? word)
      nil
      (cons {:string (str word)
             :type (.getType word)} (lazy-seq (lazy-tokenize mmseg))))))

(defn tokenize
  [^java.io.Reader input algo]
  (let [dict (Dictionary/getInstance)
        seg (condp = algo
              :simple (do (prn algo) (SimpleSeg. dict))
              :complex (do (prn algo) (ComplexSeg. dict))
              :max-word (MaxWordSeg. dict))
        mmseg (MMSeg. input seg)]
    (lazy-tokenize mmseg)))
