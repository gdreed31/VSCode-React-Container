echo 'Do you want to create a (n)ew React app or (c)lone one from git?'
read new_or_clone

if [ $new_or_clone == 'n' ]
then
    echo What is your application name?  all-lowercase-no-spaces
    read app_name
    echo Running npx create-react-app $app_name --template typescript
    npx create-react-app $app_name --template typescript

    # Install dev and testing tools
    npm i json-server
    npm i cypress
    npm i cypress-cucumber-preprocessor
    npm i cypress-react-selector
    npm i @testing-library/cypress
    npm i @testing-library/react
    npm i @testing-library/jest-dom
    npm i react-query
    npm i react-toastify
    npm i --save-dev @types/react-router-dom
    npm install npm-run-parallel
    npm audit fix
fi

if [ $new_or_clone == 'c' ]
then
    echo What is your git repo url?
    read git_url
    git clone $git_url
fi

if [ $new_or_clone != 'c' ] && [ $new_or_clone != 'n' ]
then
    echo "Please re-run and follow directions!"
fi
