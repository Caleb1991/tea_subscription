# Spec-tea-cular Subscriptions

Tea Time is an API that that leverages the power of Rails to allow a user to create a tea subscription, cancel a tea subscription, as well as see all the subscriptions for a given user.

## Technologies
Ruby on Rails </br>
RSpec

## Setup
Clone down this repo. </br>
Run bundle install via command line. </br>
Run rails db:{create,migrate}

## Schema

<img width="659" alt="Screen Shot 2021-09-24 at 7 59 54 AM" src="https://user-images.githubusercontent.com/78196294/134687828-b9a70eff-1fe6-4f11-9b36-48095e96a610.png">

## Requests and Responses

`get "http:://api/v1/customers/2"`

<img width="450" alt="Screen Shot 2021-09-24 at 8 08 06 AM" src="https://user-images.githubusercontent.com/78196294/134688328-a9d4e755-b08a-443a-853b-8f2c811597e5.png">

`post "http://localhost:3000/api/v1/subscriptions"`

<img width="277" alt="Screen Shot 2021-09-24 at 8 09 39 AM" src="https://user-images.githubusercontent.com/78196294/134688551-9d00e17c-3b67-4390-8fb8-23ee97d21caa.png">

`patch "http://localhost:3000/api/v1/subscriptions/5"`

<img width="255" alt="Screen Shot 2021-09-24 at 8 10 43 AM" src="https://user-images.githubusercontent.com/78196294/134688711-c48262a1-24ba-450a-af20-3e58f79f26aa.png">
