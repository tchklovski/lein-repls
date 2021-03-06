#!/bin/bash
#------------------------------------------------------------------------------
# Copyright (c) Frank Siebenlist. All rights reserved.
# The use and distribution terms for this software are covered by the
# Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
# which can be found in the file COPYING at the root of this distribution.
# By using this software in any fashion, you are agreeing to be bound by
# the terms of this license.
# You must not remove this notice, or any other, from this software.
#------------------------------------------------------------------------------

# cljsh-example.sh is a bash shell script that tests most non-interactive use cases for cljsh.

# Use the following command to capture the annotated output of this script in a log-file
# ./cljsh-test.sh  > cljsh-test.log 2>&1

# all clojure scripts are passed to the "lein repl" server over the network/loopback 
# for eval, and the output is brought back to stdout.

# note that the lein-repl must be running for cljsh to work
# you must have a "lein repl" session running in a terminal somewhere

#------------------------------------------------------------------------------
# evaluate clojure-code passed as command line argument with -c
cljsh -c '(println "=> hello")'
#------------------------------------------------------------------------------
# => hello
#------------------------------------------------------------------------------
# multiple statements can be added thru multiple -c directives
cljsh -c '(println "=> hello")' -c '(println "=> there")'
#------------------------------------------------------------------------------
# => hello
# => there
#------------------------------------------------------------------------------

# Note that by default, the eval results are not printed, which can be confusing:
cljsh -c '"=> hi - you cannot see me"'
#------------------------------------------------------------------------------
# => (...nothing...)
#------------------------------------------------------------------------------

# We can turn on the eval result printing with the -p flag:
cljsh -pc '"now you can see me"'
#------------------------------------------------------------------------------
# "now you can see me"
#------------------------------------------------------------------------------

# a disadvantage of the eval result printing is that you get those results (line "nil"s)
# in your output mixed together with what you actually explicitly "print":
cljsh -pc '(println "=> this is followed by a nil on the next line as the result from evaluating println")'
#------------------------------------------------------------------------------
# => this is followed by a nil on the next line as the result from evaluating println
# nil
#------------------------------------------------------------------------------

# by turning the eval result printing off (default), the only thing printed is what we explicitly write to stdout
cljsh -c '(println "=> this is NOT followed by a nil on the next line")'
#------------------------------------------------------------------------------
# => this is NOT followed by a nil on the next line
#------------------------------------------------------------------------------

# cljsh interacts with a persistent repl - any changes to the repl-state are preserved across cljsh invocations:
cljsh -pc '(defn jaja [t] (println t))'
#------------------------------------------------------------------------------
#  #'user/jaja
#------------------------------------------------------------------------------
cljsh -c '(jaja "=> hello again")'
#------------------------------------------------------------------------------
# => hello again
#------------------------------------------------------------------------------

# we can pipe the clojure code in thru stdin:
echo '(println "=> coming in from the left...")' | cljsh
#------------------------------------------------------------------------------
# => coming in from the left...
#------------------------------------------------------------------------------

# or both as command line and piped code:
echo '(println "=> then from pipe")' | cljsh -c '(println "=> first from arg")'
#------------------------------------------------------------------------------
# => first from arg
# => then from pipe
#------------------------------------------------------------------------------

# we can also read from a single clojure file:
echo '(println "=> this is from the tst.clj file")' > tst.clj
cljsh tst.clj
#------------------------------------------------------------------------------
# => this is from the tst.clj file
#------------------------------------------------------------------------------

# watch the sequence of code eval:
echo '(println "=> three (file)")' > tst.clj
echo '(println "=> four (pipe)")' | cljsh -c '(println "=> one (arg)")' -c '(println "=> two (next arg)")' tst.clj
#------------------------------------------------------------------------------
# => one (arg)
# => two (next arg)
# => three (file)
# => four (pipe)
#------------------------------------------------------------------------------

# only a single clojure file is evaluated, which is the first argument that is not (part of) an option.
# additional args after the file name are assigned to "cljsh.core/*cljsh-command-line-args*",
# while the file name itself is assigned to "cljsh.core/*cljsh-command-line-file*":
echo '(println "=> additional args: " cljsh.core/*cljsh-command-line-file* cljsh.core/*cljsh-command-line-args*)' > tst.clj
cljsh tst.clj -a -b -c why -def not 
#------------------------------------------------------------------------------
# => additional args:  /Users/franks/Development/Clojure/lein-repls/bin/tst.clj -a -b -c why -def not
#------------------------------------------------------------------------------

# "cljsh.core/*cljsh-command-line-args*" holds a string like "$0 $*" with the absolute file path 
# of the clojure file as the 0th arg followed by any other positional args.
# interpretation of those args is up to the Clojure code...

# another option is to embed clojure code in an executable script file thru #!:
echo '#!/usr/bin/env cljsh' > tst.cljsh
echo '(println "=> one")' >> tst.cljsh
echo '(println "=> and that is two")' >> tst.cljsh
chmod +x tst.cljsh
./tst.cljsh
#------------------------------------------------------------------------------
# => one
# => and that is two
#------------------------------------------------------------------------------

# we also have the command line arguments available thru "cljsh.core/*cljsh-command-line-args*":
echo '#!/usr/bin/env cljsh' > tst.cljsh
echo '(println "=> args passed with script:" cljsh.core/*cljsh-command-line-file* cljsh.core/*cljsh-command-line-args*)' >> tst.cljsh
chmod +x tst.cljsh
./tst.cljsh -a b -cd efg
#------------------------------------------------------------------------------
# => args passed with script: /Users/franks/Development/Clojure/lein-repls/bin/tst.cljsh -a b -cd efg
#------------------------------------------------------------------------------

# alternatively, we can use the "Here Document" construct to easily write clojure code in bash shell scripts
# either without parameter substitution:
ONE="one"
cljsh <<"EOCLJ"
(println "=> ${ONE}")
(do 
	(println "=> two")
	(prn "=> three"))
EOCLJ
#------------------------------------------------------------------------------
# => ${ONE}
# => two
# "=> three"
#------------------------------------------------------------------------------

# or with the shell's parameter substitution when we needed:
ONE="one"
cljsh <<EOCLJ
(println "=> ${ONE}") 
(do 
	(println "=> two")
	(prn "=> three"))
EOCLJ
#------------------------------------------------------------------------------
# => one
# => two
# "=> three"
#------------------------------------------------------------------------------

# we can also feed any arbitrary data stream thru stdin that we process with a clojure script, 
# but we have to indicate that what comes in thru stdin is not clojure code with the -t option:
echo "=> this is a stream of text and no clojure code" | cljsh -t -c '(prn (read-line))'
#------------------------------------------------------------------------------
# "=> this is a stream of text and no clojure code"
#------------------------------------------------------------------------------

# processing a text stream allows you to easily write unix-like filters in clojure:
# prepare test file with text:
echo "=> this is a stream of text" > tst.txt
echo "=> all lower case" >> tst.txt
echo "=> that wants to be upper'ed" >> tst.txt
# write the clojure filter code - note -t option for text processing for the #! directive
# also you HAVE to close *in* in your script otherwise you'll wait a looong time
# (note that there is no way to add a kill-switch automagically at the end of the code...)
# possible alternative: (doseq [line (line-seq (java.io.BufferedReader. *in*))] (println line))
cat <<"EOCLJ" > upper.cljsh
#!/usr/bin/env cljsh -t
(require 'clojure.string)
;; (loop [l (read-line)] 
;; 	(when l 
;; 		(prn (clojure.string/upper-case l)) 
;;		(recur (read-line))))
(doseq [line (line-seq (java.io.BufferedReader. *in*))] 
    (prn (clojure.string/upper-case line)))
(.close *in*)
EOCLJ
chmod +x upper.cljsh
# test the filter:
cat tst.txt | ./upper.cljsh
#------------------------------------------------------------------------------
# "=> THIS IS A STREAM OF TEXT"
# "=> ALL LOWER CASE"
# "=> THAT WANTS TO BE UPPER'ED"
#------------------------------------------------------------------------------

# see if it behaves well as a true unix filter by lowering it again:
cat tst.txt | ./upper.cljsh | tr '[:upper:]' '[:lower:]'
#------------------------------------------------------------------------------
# "=> this is a stream of text"
# "=> all lower case"
# "=> that wants to be upper'ed"
#------------------------------------------------------------------------------

# that's all folks... enjoy!
# EOF "cljsh-test.sh"