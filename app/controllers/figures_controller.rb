class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    puts params
    @figure = Figure.create(name: params["figure"][:name])
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    elsif !(params["figure"]["landmark_ids"] == nil)
      @figure.landmarks << Landmark.find(params["figure"]["landmark_ids"][0].gsub("landmark_", ""))
    end
    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    elsif !(params["figure"]["title_ids"] == nil)
      @figure.titles << Title.find(params["figure"]["title_ids"][0].gsub("title_", ""))
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  post '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    if !params[:landmarks][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

end
