(defproject cryogen "0.1.0"
  :description "Simple static site generator"
  :url "https://github.com/lacarmen/cryogen"
  :license {:name "Eclipse Public License"
            :url "http://www.eclipse.org/legal/epl-v10.html"}
  :dependencies [[org.clojure/clojure "1.8.0"]
                 [ring/ring-devel "1.6.3"]
                 [compojure "1.6.0"]
                 [ring-server "0.5.0"]
                 [cryogen-asciidoc "0.1.3"]
                 [cryogen-core "0.1.61"]]
  :plugins [[lein-ring "0.9.7"]]
  :main cryogen.core
  :ring {:init cryogen.server/init
         :handler cryogen.server/handler})
