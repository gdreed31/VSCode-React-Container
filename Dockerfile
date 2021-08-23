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



# npm i json-server
# npm i cypress
# npm i cypress-cucumber-preprocessor
# npm i cypress-react-selector
# cnpm i @testing-library/cypress
# npm i @testing-library/react
# npm i @testing-library/jest-dom
# npm i react-query
# npm i react-toastify
# RUN npm i create-react-app
# npx create-react-app my-app --template typescript


RUN mkdir /.initScripts
COPY --chown=root:root create-react-app.sh /.initScripts/
RUN chmod o+x /.initScripts/create-react-app.sh

RUN mkdir /projects
# Set the directory
WORKDIR /projects

EXPOSE 8080
EXPOSE 8000
EXPOSE 3000
EXPOSE 3001