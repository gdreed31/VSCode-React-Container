echo What is your application name?  all-lowercase-no-spaces
read varname
echo Running npx create-react-app $varname --template typescript
npx create-react-app $varname --template typescript

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
