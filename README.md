Makefile
========

What is a Makefile ?
--------------------
`Makefile` is a file used by `GNU make` where dependency relationship are listed. Variable are used to avoid repeation (because coder are lazy).
There are two types of action :
* A `Creation / Updating` action.
* A `phony` action.

You can find a complete guide [here](http://ftp.gnu.org/old-gnu/Manuals/make-3.79.1/html_chapter/make_1.html#SEC1)

`Creation / Updating` actions
-----------------------------
Those actions just creat or update the file asked.
exemple : `make arg_error.o`

`phony` actions
---------------
Those actions just do something, without creating any file.
exemple : `make clean`
