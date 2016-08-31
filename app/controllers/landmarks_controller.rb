class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  post '/posts' do
    @landmark = Landmark.create(params["landmark"])
    redirect to "/landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/edit'
  end

  patch '/posts/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.name = params[:name]
    #probs needa assign figure here
    @landmark.save
    redirect to "/landmarks/#{@landmark.id}"
  end

end
