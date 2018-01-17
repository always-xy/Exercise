Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'manage'=>'people#index_manage'
  get 'people/index_manage_approve'=>'people#index_manage_approve'
  root 'people#index'
  get 'people(/index)'=>'people#index'
  get 'people/apply'=>'people#apply'
  match 'people/apply_create'=>'people#apply_create',:via=>[:PATCH,:post]
  get 'people/vote_index'=>'people#vote_index'
  get 'people/vote_index_search'=>'people#vote_index_search'
  get 'people/vote_index_detail'=>'people#vote_index_detail'
  get 'people/vote_index_detail_count'=>'people#vote_index_detail_count'
  get 'people/active_rule'=>'people#active_rule'

end