Rails.application.routes.draw do
  resources :courses do
    resources :students 
  end

  resources :students do
    resources :courses 
  end

  resources :enrollments
end
