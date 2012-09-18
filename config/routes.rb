Blog::Application.routes.draw do
    root :to => 'frontend#index'

    match 'show/:id' => 'frontend#show'
    match 'post-comment' => 'frontend#postComment'

    match 'admin/' => 'backend#index', :as => 'admin_root'

    resources :posts, :path => 'admin/posts'
    resources :comments, :path => 'admin/comments'
    resources :tags, :path => 'admin/tags'
end
