Rails.application.routes.draw do
  get 'announcements/index'

  get 'announcements/show'

  get 'announcements/new'

  get 'announcements/create'

  get 'announcements/destroy'

  get 'users/index'

  get 'users/show'

  get 'users/edit'

  get 'users/update'

  get 'users/new'

  get 'users/create'

  get 'users/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
