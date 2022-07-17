This repository powers multiple language support for
[CodeCrafters](https://codecrafters.io) challenges.

<!-- toc -->
## Table of Contents

- [Objective](#objective)
- [Components](#components)
  * [Dockerfile](#dockerfile)
  * [Starter Repo](#starter-repo)
- [Constraints](#constraints)
  * [Fast build times](#fast-build-times)
  * [Easy to start](#easy-to-start)
- [Contributing](#contributing)

<!-- tocstop -->

## Objective

The language one uses for a CodeCrafters challenge is an integral part of the
challenge experience. A few questions to think about:

- Is it easy to setup locally? 
- Does the standard library have all required functions to complete the
  challenge?
- Are there any tricky areas where people are likely to get stuck? 

We'll tackle these problems through a combination of: 

- Sample code to get started
- Troubleshooting advice in the README
- Helpful language-specific hints in stages wherever applicable

## Components

For a language to be supported in a specific challenge, we need the following
things in place:

- A [Dockerfile](https://docs.docker.com/engine/reference/builder/), which'll be
  used to build the container where code is evaluated.
- A starter repo, like [this
  one](https://github.com/codecrafters-io/redis-starter-py).

### Dockerfile

You'll need one Dockerfile per language version supported. These'll be placed under the
`dockerfiles/<course>` folder. 

The Dockerfile needs to setup the language + all required dependencies, and make
the `tester` executable available at `/bin/tester`.

Wherever possible, utilize Docker's build cache.

### Starter Repo

The starter repo needs to contains the following files: 

- `codecrafters.yml`
- `README.md`
- An executable script / entry point, based on the challenge. `your_docker.sh`
  for Docker, `your_git.sh` for Git etc. 
- An `app` folder, that contains boilerplate code that the user will build upon.
  This code must also include a section that can be commented out to pass the
  first stage. 
  
Any language-specific code must adhere to common conventions or style guides for
that language.

Since starter repos for different languages are likely to have a lot of similar
code, we use templates to create these. The raw files are under
`starter_templates`, the compiled versions are under `compiled_starters`.

## Constraints

### Fast build times

Slow build times drastically affect the codecrafters challenge experience.
Building an image for a language and executing the starter should be snappy -
ideally under 1 second.

To achieve this, we use [Docker's build
caching](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#leverage-build-cache).

### Easy to start

The experience of downloading a repository, running it locally, receiving
results via a git push etc. can be pretty daunting to a new user who isn't used
to how CodeCrafters works.

We make this easier by adding a concise step-by-step README, and also including
all code needed to pass the first stage.

## Contributing

Thank you for considering contributing to this project!

Here's a detailed guide on [Adding support for a new language](docs/adding_support_for_a_new_language.md). If you need 
help, feel free to ask in the [Discord](https://discord.gg/DeqUD2P) server.
