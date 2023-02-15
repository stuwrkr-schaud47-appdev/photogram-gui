Rails.application.routes.draw do
  get("/", { :controller => "users", :action => "index" })
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:path_username", { :controller => "users", :action => "show" })
  get("/insert_user", { :controller => "users", :action => "insert"})
  get("/update_user/:path_id", { :controller => "users", :action => "update"})

  get("/photos", { :controller => "photos", :action => "index" })
  get("/photos/:path_id", { :controller => "photos", :action => "show" })
  get("/delete_photo/:path_id", { :controller => "photos", :action => "delete"})
  get("/insert_image", { :controller => "photos", :action => "insert"})
  get("/update_photo/:path_id", { :controller => "photos", :action => "update"})
  get("/insert_comment", { :controller => "photos", :action => "insert_comment"})
end
