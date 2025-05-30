Rails.application.routes.draw do
  # Routes for the Restaurant resource:

  root "sessions#index"

  # CREATE
  post("/insert_restaurant", { :controller => "restaurants", :action => "create" })
          
  # READ
  get("/restaurants", { :controller => "restaurants", :action => "index" })
  
  get("/restaurants/:path_id", { :controller => "restaurants", :action => "show" })
  
  # UPDATE
  
  post("/modify_restaurant/:path_id", { :controller => "restaurants", :action => "update" })
  
  # DELETE
  get("/delete_restaurant/:path_id", { :controller => "restaurants", :action => "destroy" })

  #------------------------------

  # Routes for the Session resource:

  # CREATE
  post("/insert_session", { :controller => "sessions", :action => "create" })
          
  # READ
  get("/sessions", { :controller => "sessions", :action => "index" })
  
  get("/sessions/:path_id", { :controller => "sessions", :action => "show" })
  
  # UPDATE
  
  post("/modify_session/:path_id", { :controller => "sessions", :action => "update" })
  
  # DELETE
  get("/delete_session/:path_id", { :controller => "sessions", :action => "destroy" })

  #------------------------------

  # Routes for the Message resource:

  # CREATE
  post("/insert_message", { :controller => "messages", :action => "create" })
          
  # READ
  get("/messages", { :controller => "messages", :action => "index" })
  
  get("/messages/:path_id", { :controller => "messages", :action => "show" })
  
  # UPDATE
  
  post("/modify_message/:path_id", { :controller => "messages", :action => "update" })
  
  # DELETE
  get("/delete_message/:path_id", { :controller => "messages", :action => "destroy" })

  #------------------------------

  devise_for :users

  # rake on render

  get("/rake_tasks", { :controller => "rake_tasks", :action => "show" })
  get("/run_task", { :controller => "rake_tasks", :action => "run_task" })

end
