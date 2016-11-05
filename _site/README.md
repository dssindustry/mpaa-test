# BGA Style Guide

## Github pages

The BGA Style Guide runs on a github pages hosting platform, this means 
that the website is written in html, scss, markdown and liquid, and uses
jekyll to compile into a site.

The website can be compiled locally using jekyll, or can be pushed to a 
github repository using the branch name `gh-pages`, where github will compile
it and host it.

The site is hosted at [https://ausgov.github.io/bga-style-guide](https://ausgov.github.io/bga-style-guide/).

## Pulling the style guide

To pull the bga style guide, go to [https://github.com/AUSGov/bga-style-guide](https://github.com/AUSGov/bga-style-guide)
and clone the site to a local directory.

In order to run the site locally, follow the steps for installation found at
[https://jekyllrb.com/docs/installation/](https://jekyllrb.com/docs/installation).

If you are trying to run the site on a windows machine, then try following to steps
for windows found at [https://jekyllrb.com/docs/windows/#installation](https://jekyllrb.com/docs/windows/#installation)
(I have not tried these steps).

Once you have Jekyll installed on your machine, use terminal to cd into the project
directory.

```cd ~/Desktop/bga-style-guide```

Once in the project directory, run the following command to fire up a local
server and compile the directory.

```jekyll serve --baseurl ''```

`jekyll serve` fires up a local server, the `--baseurl ''` tells jekyll to
override the `baseurl` variable in `_config.yml` to and empty string. The
`baseurl` is set to `/bga-style-guide` otherwise - so that the relative links
work once it's hosted on github.

After running the jekyll serve command, you will see that you project directory
now has a subdirectory called `_site`, this is where the compiled files sit. They 
are ignored by the `.gitignore` file, as they shouldn't be pushed to the remote
repository.

Navigate to localhost:4000 to see the local version of the compiled site.

## The future

The future aim of this site is to provide guideance on UI and design decisions, as well
as to provide information on what styles should be used for consistency across 
bga websites.

As a part of this, we hope to be able to use this site to link to scss files, such as a
_variables.scss file that can be pulled down and used as the base for all sites. This
way if any changes are made to code that is common across sites, it can be pulled down,
tested and implemented.