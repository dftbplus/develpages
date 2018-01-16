*********************
DFTB+ developer pages
*********************

This repository contains the files and scripts needed to create the DFTB+
developer website. The main page can be generated using Jekyll, while the
specific documentation pages can be generated using their document generator
(e.g. sphinx, doxygen).


Prerequisites
=============

You need following programs in order to generate the webpage:

* Jekyll

* Sphinx

* Doxygen



Generating the website
======================

In order to create the site, go to the directory which should contain the
generated site and invoke the ``scripts/build_all.sh`` script from this
repository. You will have to pass a temporary directory as the only argument,
where the builder can store temporary data.

For example, if you checked out this repository in the folder `develpages` and
the web site should be created in the folder `dftbplus.github.io`, you would
execute following commands::

  cd dftbplus.github.io
  ../develpages/scripts/build_all /tmp/develpage-build

This should build the website in the `dftbplus.github.io` folder, using the
temporary directory `/tmp/develpage-build`.
