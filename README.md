# clj-mmseg

Clojure wrapper for zhuomingliang/mmseg4j

## Usage

```clojure

(require '[clj-mmseg.core :as mmseg])

(mmseg/tokenize (java.io.StringReader. "首先来理解一下chunk，它是MMSeg分词算法中一个关键的概念。") :complex)
; => ({:string "首先", :type "word"} {:string "来", :type "word"} {:string "理解", :type "word"}
;     {:string "一下", :type "word"} {:string "chunk", :type "letter"}
;     {:string "它是", :type "word"} {:string "mmseg", :type "letter"} 
;     {:string "分词", :type "word"} {:string "算法", :type "word"}
;     {:string "中", :type "word"} {:string "一个", :type "word"}
;     {:string "关键", :type "word"} {:string "的", :type "word"} {:string "概念", :type "word"})

```

## Development

```bash

# pull mmseg4j as a local dependency
make all
lein deps

```

## Todo
- [ ] doc string for tokenize
- [ ] unit test

## License

Copyright © 2013 

Distributed under the Eclipse Public License, the same as Clojure.
