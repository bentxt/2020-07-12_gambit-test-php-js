;; file: lib.scm

;(declare (standard-bindings) (extended-bindings) (not safe) (not run-time-bindings))

(declare (standard-bindings) (extended-bindings) (not safe) (not run-time-bindings))
(declare (not standard-bindings append for-each))

(println ">>> xxxlibphp.scm")

(define (for-each f lst)
  (if (pair? lst)
      (begin
        (f (car lst))
        (for-each f (cdr lst)))))

(define (append lst1 lst2)
  (if (pair? lst1)
      (cons (car lst1) (append (cdr lst1) lst2))
      lst2))


(define (hostlist)
;   (##inline-host-expression "g_host2scm(8)"))
   (##inline-host-expression "g_host2scm(array(88,222, 2222))"))

(define (current-milliseconds)
  (##inline-host-expression "Date.now()"))

(define (alert obj)
  (##inline-host-statement "echo(g_scm2host(@1@));" obj))

(define (basename obj)
  (##inline-host-statement "basename(g_scm2host(@1@));" obj))


(app#) ;; execute app.scm module
