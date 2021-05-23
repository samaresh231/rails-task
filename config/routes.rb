Rails.application.routes.draw do
  resources :courses do
    resources :students, controller: 'studentlists' 
  end

  resources :students do
    resources :courses, controller: 'enrollments'
  end
end
