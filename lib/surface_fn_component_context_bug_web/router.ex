defmodule SurfaceFnComponentContextBugWeb.Router do
  use SurfaceFnComponentContextBugWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {SurfaceFnComponentContextBugWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SurfaceFnComponentContextBugWeb do
    pipe_through :browser

    live "/", PageLive
  end

  # Other scopes may use custom stacks.
  # scope "/api", SurfaceFnComponentContextBugWeb do
  #   pipe_through :api
  # end
end
