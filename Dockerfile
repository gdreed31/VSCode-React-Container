# Our project code uses Java 1.8, and we run in Debian Buster
FROM debian:latest

ARG NODE_VERSION='14.17.5'

# Install:
# - npm / n / yarn 
# - netcat (required by CI build)
RUN apt-get update && \
    apt-get -y install ripgrep less curl netcat npm && \
    npm install -g n && \
    n ${NODE_VERSION}

RUN npm install -g yarn
	
# Install Git command line completion
RUN curl https://raw.githubusercontent.com/git/git/v2.20.1/contrib/completion/git-completion.bash -o ~/.git-completion.bash && \
    echo "[ -f ~/.git-completion.bash ] && . ~/.git-completion.bash" >> ~/.bashrc

RUN mkdir /projects
# Set the directory
WORKDIR /projects

EXPOSE 8080
EXPOSE 8000
EXPOSE 3000