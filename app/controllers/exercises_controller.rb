class ExercisesController < ApplicationController
    before_action :set_exercise, only: [:show, :edit, :update, :destroy]
  
    def index
      @exercises = Exercise.all
    end
    
    def show
    end 
    
    def new 
      @exercise = Exercise.new
    end 

    def create 
      @exercise = Exercise.new(set_params)
      @exercise[:status] = params[:status].to_i
      
      if @exercise.save 
        flash[:success] = "exercise created successfully!"
      else 
        flash[:danger] = "problem creating exercise"
        render "new"
      end 
        redirect_to exercise_path(@exercise)
    end 
    
    def edit
      
    end 
    
    def update
      
      @exercise.status = params[:status].to_i 
      if @exercise.update_attributes(set_params) 
         flash[:success] = "successfully updated"
      else 
         flash[:danager] = "not updated"
      end 
         redirect_to exercise_path(@exercise)
    end 

    def test
    
      @the_last_exercise = Exercise.last 
      
      @quantity = params[:quantity].to_i 
   
      @array_tenses = Exercise.tenses
      @array_passives = Exercise.passives
      @array_subjunctives = Exercise.subjunctives
      @array_conditionals = Exercise.conditionals
      @array_reported = Exercise.reported
      @array_modals = Exercise.modals
      @array_gerunds = Exercise.gerunds
      
      @ten_num = params[:tenses].inspect 
      @pas_num = params[:passives].inspect
      @sub_num = params[:subjunctives].inspect
      @con_num = params[:conditionals].inspect
      @mod_num = params[:modals].inspect
      @rep_num = params[:reported].inspect
      @ger_num = params[:gerunds].inspect
      
      
      @array_to_pick = []

      if params[:tenses] 
        @array_to_pick << @array_tenses
      end 
      if params[:passives] 
        @array_to_pick << @array_passives
      end 
      if params[:subjunctives] 
        @array_to_pick << @array_subjunctives
      end 
      if params[:conditionals]
        @array_to_pick << @array_conditionals
      end 
      if params[:reported] 
        @array_to_pick << @array_reported
      end 
      if params[:modals] 
        @array_to_pick << @array_modals
      end 
      if params[:gerunds]
        @array_to_pick << @array_gerunds
      end 
      
      @array_to_pick_flattened = @array_to_pick.flatten 
      @selected_array = []
      
      @show_warning_message = false
      unless @quantity > @array_to_pick_flattened.count 
        while @quantity > @selected_array.count do 
          @rand_elem = @array_to_pick_flattened[rand(@array_to_pick_flattened.count)]
          if !@selected_array.include?(@rand_elem)
             @selected_array << @rand_elem      
          end
        end
      else
        @show_warning_message = true
        @msg = "Choose more chapters, because we don't have that many exercises ;("
      end 
         
    end   
    
    private 
    
    def set_params 
       params.require(:exercise).permit(:sentence, :answer, :status, :quantity, :transform, :word_prompt)
    end 
    
    def set_exercise
      @exercise = Exercise.find(params[:id])
    end 
  
end     
