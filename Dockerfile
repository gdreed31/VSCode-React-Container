FROM node:14-alpine

# Install:
RUN apk update && \
   apk add --no-cache curl bash git netcat-openbsd
	
# Install Git command line completion
RUN curl https://raw.githubusercontent.com/git/git/v2.20.1/contrib/completion/git-completion.bash -o ~/.git-completion.bash && \
    echo "[ -f ~/.git-completion.bash ] && . ~/.git-completion.bash" >> ~/.bashrc

# Setup create-react-app script to run in .devcontainer postCreateCommand
RUN mkdir /.initScripts
COPY --chown=root:root create-react-app.sh /.initScripts/
RUN chmod o+x /.initScripts/create-react-app.sh

# Set the work directory
RUN mkdir /projects
WORKDIR /projects

EXPOSE 8080
EXPOSE 8000
EXPOSE 3000
EXPOSE 3001