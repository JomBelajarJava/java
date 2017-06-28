#!/usr/bin/sbcl --script

;; update-page-index.lisp

;; The tutorial pages in Jom Belajar Java uses :page-index metadata to
;; determine their position. To update the metadata, update the position
;; in page-index.txt file, and then run this script.

;; Page tutorial dalam Jom Belajar Java menggunakan metadata :page-index
;; untuk menentukan kedudukan. Untuk update metadata tersebut, update
;; kedudukan page tersebut dalam page-index.txt, kemudian run script ini.

(defun assoc-page-index (file)
  "Read each lines from a file and associate them with its line number."
  (with-open-file (stream file)
    (loop for line = (read-line stream nil)
          for i from 0
          while line
          collect (cons line i))))

(defun read-page (file)
  "Read all contents from a file into a list."
  (with-open-file (stream file)
    (loop for line = (read-line stream nil)
          while line
          collect line)))

(defun update-page-index (page-and-index)
  "Update page index for the page."
  (destructuring-bind (page . index) page-and-index
    (let* ((file  (format nil "resources/templates/asc/pages/~a" page))
           (lines (read-page file)))
      (with-open-file (out file
                           :direction :output
                           :if-exists :supersede)
        (dolist (line lines)
          (if (search ":page-index" line)
              (write-line (format nil ":page-index ~d" index) out)
              (write-line line out)))))))

(defun update ()
  "Run script."
  (dolist (page-and-index (assoc-page-index "page-index.txt"))
    (update-page-index page-and-index)))

(update)

(format t "Done updating page index.~%")
