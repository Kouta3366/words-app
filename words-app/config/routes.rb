Rails.application.routes.draw do
  get "signup" => "users#new"
  get "login" => "users#login_form"
  get 'home/about'
  post "users/create" => "users#create"
  get 'home/top'
  post "logout" => "users#logout"
  post "login" => "users#login"
  post "lists/:id/start" => "lists#start"
  get "lists/new" => "lists#new"
  post "lists/create" => "lists#create"
  get "lists/:id/show" => "lists#show"
  get "lists/:id/start" => "lists#start"
  get "lists/:id/edit" => "lists#edit"
  post "card/:id/create" => "lists#new_card"
  get "lists/:id/edit2" => "lists#edit2"
  post "card/:id/update" => "lists#update"
  get "card/:id/destroy" => "lists#destroy"
  get "lists/:id1/card1/:id2" => "lists#card1"
  get "lists/:id1/card2/:id2" => "lists#card2"
  get "lists/:id1/card3/:id2" => "lists#card3"
  get "lists/:id1/card4/:id2" => "lists#card4"
  get "lists/end" => "lists#end"
end
