The **Bootstrap** repository uses a SCRUM framework adapted to standard GitHub
tooling.  **Bootstrap** is integrated with Travis-ci.org for continuous
integration and AllanConsulting.slack.com for centralized notification.

# Installation
## Bootstrap 
```bash
$ cd $HOME
$ git clone http://github.com/Traap/bootstrap.git \
      && cd bootstrap \
      && chmod +x install.sh \
      && ./install.sh --all \
      && source ${HOME}.bashrc \
      && vim
```

## Dependencies 
* [The Haskell Tool Stack](https://docs.haskellstack.org/en/stable/README/#the-haskell-tool-stack)

# Project Management
## Project Name and Project Board.
[Bootstrap](https://github.com/Traap/bootstrap/projects/1) is the project
name.  The project board has the following columns:
* **Backlog** - [Issues](https://github.com/Traap/bootstrap/issues)
  that have not been started.
* **In Progress** - [Issues](https://github.com/Traap/bootstrap/issues).
* **In Review** - [Issues](https://github.com/Traap/bootstrap/issues) that
  have are part of a [pull request](https://github.com/Traap/bootstrap/pulls).
* **Done** - [Issues](https://github.com/Traap/bootstrap/issues) that are done.
* **Pull Resuest** - [Issues](https://github.com/Traap/bootstrap/issues) that
  are a [pull request](https://github.com/Traap/bootstrap/pulls).

## What does Done mean?
[Bootstrap](https://github.com/Traap/bootstrap/projects/1) uses different
done classifications as follows:
* **duplicate** - A reference to one or more duplicate
  [Issues](https://github.com/Traap/bootstrap/issues) is provided.
* **invalid** - An [Issues](https://github.com/Traap/bootstrap/issues) has
  been determined to be invalid.  A rationale is given.
* **wontfix** - An [Issues](https://github.com/Traap/bootstrap/issues) will
  not be fixed and a rationale is given.

## Milestones Equate to Sprints.
[Bootstrap](https://github.com/Traap/bootstrap/projects/1) uses GitHub
[milestones](https://github.com/Traap/bootstrap/milestones) as a Sprint.  The
project uses 5-day sprints and started on February 23th, 2017.  Sprints names use
the following naming convention: Sprint vM.N.S, where
* **M** - the major Release number starting with 1.
* **N** - the minor Release number starting with 0.
* **S** - the Sprint number starting with 0.

Therefore the next Sprints have been declared:
* **Sprint v1.0.0** - Started 2017.02.23 and ended 2017.02.24.
* **Sprint v1.0.1** - Started 2017.02.27 and ended 2017.03.03.
* **Sprint v1.0.2** - Started 2017.03.06 and ended 2017.03.10.

## Labels
[Bootstrap](https://github.com/Traap/bootstrap/projects/1) uses labels as
follows:
* **bug** - is an [Issues](https://github.com/Traap/bootstrap/issues) that did
  not meet the intent of the Story.
* **duplicate** - is an [Issues](https://github.com/Traap/bootstrap/issues)
  that duplicates another issue regardless of the
  [Issues](https://github.com/Traap/bootstrap/issues) label.  A rationale is
  given for duplicate [Issues](https://github.com/Traap/bootstrap/issues).
* **enhancement** - the Agile Story format
```
    As a <type of user> I want <some goal> so that <some reason>.
```
* **help wanted** - is most often used as a secondary tag to ask for help
  determining the direction an
  [Issues](https://github.com/Traap/bootstrap/issues) should take.
* **invalid** - is an issue that is invalid.  A rationale is given for invalid
  [Issues](https://github.com/Traap/bootstrap/issues).
* **pull request** - is used to label a pull request.
* **question** - is most often used as a secondary tag to ask another person
  a question and to track the answer to closure.
* **wontfix** - this [Issues](https://github.com/Traap/bootstrap/issues) will
  not be fixed.  A rationale is given
  for [Issues](https://github.com/Traap/bootstrap/issues) that are not fixed.

## Releases
[Bootstrap](https://github.com/Traap/bootstrap/projects/1) consist of one or
more milestones.  Release names use the following naming convention: vM.N.P
name, where
* **M** - the major Release number starting with 1.
* **N** - the minor Release number starting with 0.
* **P** - the patch Release number starting with 0.
* **name** - a descriptive name for the release.

[Current](https://github.com/Traap/bootstrap/releases/latest)
[releases](https://github.com/Traap/bootstrap/releases) include a the deployed
version of Bootstrap source code.
